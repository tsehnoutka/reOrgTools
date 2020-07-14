'''
Created on Feb 10, 2017
 
@author: Tim Edwards

Acepts a build name as the only argument.

This program goes through the Makefile and copies anything that ends in .c,.h,cpp,or hpp.
It looks in a src directory and temporarily stores the files in a "UseThese" dir.

At the end it copies some files that are needed, but not in Makefile.
And then it renames the directories so the ones we need are in the src directory and
the ones we don't need are in the "NotUsed" directory.

After running this, run the make.  There may be somefile this program didn't find.


Things I would like to add:
- a better way to assign the ROOT directory.  Maybe as a parameter, maybe another file
- a better way to copy the additional files.  Maybe a another file.  maybe just add them to the Makefile (somehow)
- change the name of the program ;)

'''
import shutil
import subprocess
import os
import sys
import shlex

def move(src,dest):
    shutil.move(src,dest)

#  check to make sure they pass in the name of the build they want to clean
if len(sys.argv) is not 2:
    print("Usage : " + sys.argv[0] + " <the name of the build  i.e. NMX>" )
    sys.exit()

MAIN_DIR = "/home/cpi.tedw/ws/source/"
ROOT_DIR = MAIN_DIR + sys.argv[1] + "/"
#ROOT_DIR = MAIN_DIR + "ME/"
SOURCE_DIR = ROOT_DIR + "src"
DEST_DIR =  ROOT_DIR + "useThese"
if not os.path.exists(ROOT_DIR):
    print( "that build / directory does NOT exist")
    sys.exit()
if not os.path.exists(DEST_DIR):  # if the directory "useThese"does not exist, create it
    os.makedirs(DEST_DIR)

code = False   # did I find a '.c' file?
found = False  # did I find any type of source file ( .c or .h)
CPP = False    #  is the file a CPP file? 
lower = False  # is the extention in lowercase?
inList = True
iErrorCount=0
errors = []   # needed for error handling
lstFilenames = [] # I am going to store the file names so I can see if I 
                        # already saw this file.  This reduces the number of 
                        # errors that get printed.  I was getting errors of 
                        # files that didn't exist becasue I had already moved them

lstCount = []

f = open(ROOT_DIR + 'obj/Makefile', 'r')
outFile = open(ROOT_DIR +"ErrorFiles", 'w')
outFile.truncate()
cntFile = open(ROOT_DIR +"FileCounts", 'w')
cntFile.truncate();

print (ROOT_DIR)
print (SOURCE_DIR)
print (DEST_DIR)

print ("Files that had errors:")
for line in f:
#  if the line doesn't NOT begin with # and it contains a code file ( *.c, *.C, *.h, *.H )
#  I want to get the file name and move it to DEST_DIR    
    charArray = list(line)  #  read teh file one line at a time
    #print ( line)
    i = 0
    while '\n' != charArray[i] and \
           '#' != charArray[i]:
        if charArray[i] == '.':
            if charArray[i+1] == 'c' or charArray[i+1] == 'C':
                code = True   # Found a C file
                found = True
                j=i+1
                if ((charArray[i+2] == 'p' or charArray[i+2] == 'P') and (charArray[i+3] == 'p'  or charArray[i+3] == 'P')):
                    CPP = True
                    j=i+3 
            elif charArray[i+1] == 'h' or charArray[i+1] == 'H' :
                found =True
                j=i+1  # save the end position  
                #  handle all the exceptions
            if found is True: 
                lower = str.islower(charArray[i+1])
                # i should be pointing at the period
                if charArray[i-1] !=' ' and i!=0 and charArray[j+1] !='p' and \
                   charArray[i-1] != '(' and \
                   charArray[i-1] != ':' and \
                   charArray[i-1] != '=' and \
                   charArray[i-1] != '*':
                    #  I want to find the begining of the file name
                    while charArray[i] != ' '  and \
                    charArray[i] != ')'  and \
                    charArray[i] !='}' and \
                    i!=0 :
                        i-=1
                     
                    if i!=0:  # Have I found my file, I need to extract from i+1 to   j (inclusive)
                        chrFilename = line[i+1:j+1]
                        strFilename = "".join(chrFilename)  # combine the character array into a string
                        #print (strFilename)
#**************************************************************************                       
                        try:
                            index = lstFilenames.index(strFilename)   # to determine if I have seen this file name yet
                        except:   # not found in list
                            lstFilenames.append (strFilename)   #  add this file name to my list so I can 
                            lstCount.append(1)
                            #print ("%-20s\t%d" % (strFilename,1))   
                            inList = False
                            try:
                                move(SOURCE_DIR+"/"+strFilename, DEST_DIR+"/"+strFilename)
                            except IOError as why:
                                print("** strFilename" + " : " + str(why))
                                if ".h" not in strFilename:
                                    outFile.write(strFilename)
                                    outFile.write("\n")
                                    iErrorCount+=1
                                    #print (strFilename)
                            
                            if code is True:  # it's a  C / CPP file
                                #try to copy a same named header
                                aHeader = list(strFilename) 
                                if lower:
                                    aHeader[len(aHeader)-1]='h'
                                    if CPP:
                                        aHeader + ['p','p']
                                else:
                                    aHeader[len(aHeader)-1]='H'    
                                    if CPP:
                                        aHeader + ['P','P']
                                strHeader = ''.join(aHeader)
                                try:
                                    move(SOURCE_DIR+"/"+strHeader, DEST_DIR+"/" + strHeader)
                                except IOError as why:
                                    errors.append((strFilename,  str(why))) # don't do anything if the file can't be found
                                                                            #  I probably already copied the file or the header doesn't exist
                                   
                        if inList == True:  # the file name was found in the list
                            lstCount[index] += 1
                             
                        inList = True
#**************************************************************************
                    #reset i to the end of the current file name
                    i=j-1  #  we will increment i a couple line below
                # reset my flags    
                found = False
                code = False
                CPP = False
                     
        i +=1  # move to the next character until you find a '.'
outFile.write("There were %d File copy errors\n" % (iErrorCount))
outFile.close()
f.close()  #  close Makefile for reading

print ("\nCopy some needed files that are not in Makefile")
strExtraFiles = ["foxcustom.h", "foximage.h", "utils.c","XML.c","XML.hpp","common.h"]
for strFilename in strExtraFiles: 
    #print ( "copying file: " + strFilename)
    try:
        move(SOURCE_DIR  +"/"+ strFilename, DEST_DIR +"/"+ strFilename)
    except IOError as why:
        errors.append((strFilename,  str(why)))
        print("******  Error with file: " + strFilename + " : " + str(why))

print (ROOT_DIR)
print (SOURCE_DIR)
print (DEST_DIR)
print("\nRename the directories")
move(SOURCE_DIR, ROOT_DIR + "NotUsed") 
move(DEST_DIR,  SOURCE_DIR) 
print("Done with the renaming")

#**************************************************************************                       
x=0;
print("\n\n\n\n\n***********************************************\nFile counts:\n***********************************************\n")
for x in range(len(lstFilenames)):
    print ("%-20s\t%d" % (lstFilenames[x],lstCount[x]))
    cntFile.write("%-20s\t%d\n" % (lstFilenames[x],lstCount[x]))
#**************************************************************************                       
cntFile.close()  

'''
print ("start copying the files")
strCommand = MAIN_DIR + "/CopyFiles.sh " + SOURCE_DIR  
print ("the commandline is %s" % strCommand)
proc = subprocess.Popen(shlex.split(strCommand))
print ("end copying the files")
'''
print ("Processing Complete!")

  
    


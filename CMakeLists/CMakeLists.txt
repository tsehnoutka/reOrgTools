# Hello world example using CMAKE
#http://derekmolloy.ie/hello-world-introductions-to-cmake/

cmake_minimum_required(VERSION 2.8.0)
project(OpenFox)
set(CMAKE_BUILD_TYPE Release)

#MESSAGE( STATUS "CMAKE_HOME_DIRECTORY:    " ${CMAKE_HOME_DIRECTORY} )
#MESSAGE( STATUS "CMAKE_SOURCE_DIR:        " ${CMAKE_SOURCE_DIR} )
#MESSAGE( STATUS "CMAKE_CURRENT_BINARY_DIR:" ${CMAKE_CURRENT_BINARY_DIR} )
#MESSAGE( STATUS "CMAKE_CURRENT_SOURCE_DIR:" ${CMAKE_CURRENT_SOURCE_DIR} )
# set STATE_DIR and ROOT_DIR  I have to move up one directory at a time
get_filename_component(STATE_DIR ${CMAKE_HOME_DIRECTORY} DIRECTORY)
get_filename_component(ROOT_DIR ${STATE_DIR} DIRECTORY)
MESSAGE( STATUS "ROOT_DIR:" ${ROOT_DIR} )
MESSAGE( STATUS "STATE_DIR:" ${STATE_DIR} )


# Stop if FOX_NODE is not set
if (NOT(FN))
	MESSAGE(FATAL_ERROR "Please set FOX_NODE.  i.e. cmake -DFN:STRING=TEST ..") 
endif()

# check to see if FOX_NODE is one of the valid options
#set(FOX_NODE_LIST "TEST;ACCOUNT;ONSITE_DRS;ONSITE_TEST;ONSITE_DEV") # all possible configurations
set(FOX_NODE_LIST "TEST;ACCOUNT")  # specific for OSBI
if (";${FOX_NODE_LIST};" MATCHES ";${FN};" )
	MESSAGE(STATUS "The Fox is being built as: ****    ${FN}    ****")
else()
	MESSAGE(STATUS "******************************************")	
	MESSAGE(STATUS "For OSBI - FOX_NODE needs to be one of the following:")
	foreach	(OPT ${FOX_NODE_LIST})
		MESSAGE(STATUS ${OPT} )
	endforeach()
	MESSAGE(STATUS "i.e. cmake -DFN:STRING=TEST ..")
	MESSAGE(STATUS "******************************************")	
	MESSAGE(FATAL_ERROR "Retype the command with a valid value for FN") 
endif()

# set environment variable
set (OPEN_FOX_BIN_DIR "${STATE_DIR}/FOX")
set (OPEN_FOX_INC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/include")
set (FOX_INT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/interfaces")
set (COMM_SRC_DIR "${ROOT_DIR}/common/src")
set (RSA_INC_DIR "${ROOT_DIR}/rsa/library/include")
set (RSA_LIB_DIR "${ROOT_DIR}/rsa/library/lib")
set (CFG_DIR "${ROOT_DIR}/cfg")
set (ORACLE_DIR "${ROOT_DIR}/oci")


# set compiler options
MESSAGE ( STATUS "Machine Type: " $ENV{MACHTYPE})
if ("$ENV{MACHTYPE}" MATCHES "aix")
     MESSAGE (STATUS "Building for AIX")
     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g -qnamemangling=v6 -qmaxmem=9216 -DFOX_NODE=${FN}")
     set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -g -qnamemangling=v6 -qmaxmem=9216 -DFOX_NODE=${FN}")
else ()
    MESSAGE (STATUS "Building for Red Hat")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}-g -w -m32 -DFOX_NODE=${FN}")
    set (LDLIBPATHFLAGS "-Wl,-rpath=${OPEN_FOX_BIN_DIR}:${RSA_LIB_DIR}")
endif()

# set the include directories
include_directories(${RSA_INC_DIR} )       	# for encryption
include_directories(${OPEN_FOX_INC_DIR})	# for includes
include_directories(${COMM_SRC_DIR}/include)	# for certified includes

#set the linking directories
link_directories(${OPEN_FOX_BIN_DIR})  	# for foxshr, foxxml, foxtoken, and foxfips140
link_directories(${RSA_LIB_DIR}) 	# for the crypto libs


# Call the sub directory's CMakelist file to actually build the programs
add_subdirectory(${COMM_SRC_DIR}/foxlibs/shrfox ${COMM_SRC_DIR}/foxlibs/shrfox )	# Builds - shrfox
add_subdirectory(foxlibs/shrtoken)	# Builds - shrtoken
add_subdirectory(foxlibs/shrxml)	# Builds - shrxml shrxmlSPCL
add_subdirectory(${COMM_SRC_DIR}/crypto/shrfips140 ${COMM_SRC_DIR}/crypto/shrfips140)	# Builds - shrfips140
add_subdirectory(opaid)			# Builds - COMMON FLOGMON FOXCMDS FOXMON OABACKUP SYSMON OPAID OATRACE WRS  ***CERTIFIED FILES: OASSM OAMON OASTAT
add_subdirectory(interfaces)		# Builds - DMXSRV BAILIF NCITCP OVIP REMSRV NLTTCP BMVIF MMMPIF PORIF WARIF LICSRV CCHIF FTREMO FXTALK
add_subdirectory(switch)		# Builds - APPL - JJ RL RP FM RU VA US ***CERTIFIED FILES: ALERTS CP D1 ED HP JQ JT JW OR PS RS RK SM TR RC TI
					# Builds - CORE - TP ***CERTIFIED FILES: IP OP
add_subdirectory(${COMM_SRC_DIR}/switch ${COMM_SRC_DIR}/switch)		    # Builds - MISC - watchdog;iplfox;foxcreate;foxsizes
add_subdirectory(${ROOT_DIR}/cfg  ${ROOT_DIR}/cfg )   # Builds - cfs
add_subdirectory(tools/config)		# Builds - *CONFIG UTILITIES: zs zm zp
add_subdirectory(tools/utl)		# Builds - bumpforms cedit hd liconfig shmdump dumpdbx Table wsdump zdi zdat zdr zque   zp
add_subdirectory(${COMM_SRC_DIR}/postproc ${COMM_SRC_DIR}/postproc)

#create foxsizesc.h and foxsizeso.h 
set(MAKE_CMD "${COMM_SRC_DIR}/makeHeaders.sh")
#MESSAGE("COMMAND(to make foxsize headers): ${MAKE_CMD} ${CMAKE_CURRENT_SOURCE_DIR} ${OPEN_FOX_INC_DIR}")
execute_process(COMMAND ${MAKE_CMD} ${ROOT_DIR} ${CMAKE_CURRENT_SOURCE_DIR} ${OPEN_FOX_INC_DIR}
   	RESULT_VARIABLE CMD_ERROR
      	OUTPUT_FILE CMD_OUTPUT)
MESSAGE( STATUS "\nMake Headers Script")
MESSAGE( STATUS "CMD_ERROR: " ${CMD_ERROR})
MESSAGE( STATUS "CMD_OUTPUT: " ${CMD_OUTPUT} "\n")

# Print out what the FOX_NODE is set too
MESSAGE(STATUS "The Fox is being built as: ****    ${FN}    ****")




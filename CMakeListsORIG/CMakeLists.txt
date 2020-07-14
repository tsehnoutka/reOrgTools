# Hello world example using CMAKE
#http://derekmolloy.ie/hello-world-introductions-to-cmake/

cmake_minimum_required(VERSION 2.8.9)
project(OpenFox)
set(CMAKE_BUILD_TYPE Release)

#MESSAGE( STATUS "CMAKE_HOME_DIRECTORY:    " ${CMAKE_HOME_DIRECTORY} )
#MESSAGE( STATUS "CMAKE_SOURCE_DIR:        " ${CMAKE_SOURCE_DIR} )
#MESSAGE( STATUS "CMAKE_CURRENT_BINARY_DIR:" ${CMAKE_CURRENT_BINARY_DIR} )
#MESSAGE( STATUS "CMAKE_CURRENT_SOURCE_DIR:" ${CMAKE_CURRENT_SOURCE_DIR} )
# set ROOT_DIR  I have to move up one directory at a time
get_filename_component(PARENT_DIR ${CMAKE_HOME_DIRECTORY} DIRECTORY)
get_filename_component(PARENT_DIR ${PARENT_DIR} DIRECTORY)
get_filename_component(ROOT_DIR ${PARENT_DIR} DIRECTORY)
MESSAGE( STATUS "ROOT_DIR:" ${ROOT_DIR} )

# Stop if FOX_NODE is not set
# I would like to add a check to see if it is a VALID FOX_NODE value
if (NOT(FN))
	MESSAGE(FATAL_ERROR "Please set FOX_NODE.  i.e. cmake -DFN:STRING=TEST ..") 
endif()

# set environment variable
set (OPEN_FOX_BIN_DIR "${CMAKE_CURRENT_SOURCE_DIR}/bin")
set (OPEN_FOX_INC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/include")
set (OPEN_FOX_UTL_DIR "${ROOT_DIR}/states/ME/utl")
set (OPEN_FOX_CFG_DIR "${ROOT_DIR}/states/ME/config")
set (CERT_FOX_INC_DIR "${ROOT_DIR}/certified/switch")
set (RSA_INC_DIR "${ROOT_DIR}/certified/RSA/library/include")
set (RSA_LIB_DIR "${ROOT_DIR}/certified/RSA/library/lib")

# set compiler options
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g -w -m32 -DFOX_NODE=${FN}")
set (LDLIBPATHFLAGS "-Wl,-rpath=${OPEN_FOX_BIN_DIR}:${RSA_LIB_DIR}")

# set the include directories
include_directories(${RSA_INC_DIR} )       	# for encryption
include_directories(${OPEN_FOX_INC_DIR})   	# for includes
include_directories(${CERT_FOX_INC_DIR}/include)# for certified includes

#set the linking directories
link_directories(${OPEN_FOX_BIN_DIR})  	# for foxshr, foxxml, foxtoken, and foxfips140
link_directories(${RSA_LIB_DIR}) 	# for the crypto libs


# Call the sub directory's CMakelist file to actually build the programs
add_subdirectory(foxlibs/shrfox)	# Builds - shrfox
add_subdirectory(foxlibs/shrtoken)	# Builds - shrtoken
add_subdirectory(foxlibs/shrxml)	# Builds - shrxml shrxmlSPCL
add_subdirectory(foxlibs/shrfips140)	# Builds - shrfips140
add_subdirectory(opaid)			# Builds - COMMON FLOGMON FOXCMDS FOXMON OABACKUP SYSMON OPAID OATRACE WRS  ***CERTIFIED FILES: OASSM OAMON OASTAT
add_subdirectory(interfaces)		# Builds - DMXSRV BAILIF NCITCP OVIP REMSRV NLTTCP BMVIF MMMPIF PORIF WARIF LICSRV CCHIF FTREMO FXTALK
add_subdirectory(switch/APPL)		# Builds - JJ RL RP FM RU VA US ***CERTIFIED FILES: ALERTS CP D1 ED HP JQ JT JW OR PS RS RK SM TR RC TI
add_subdirectory(switch/CORE)		# Builds - TP ***CERTIFIED FILES: IP OP
add_subdirectory(switch/CORE/config/6)  # Builds - cfs
add_subdirectory(util)			# Builds - bumpforms cedit hd liconfig shmdump dumpdbx Table wsdump zdi zdat zdr zque  *CONFIG UTILITIES: zs zm zp
add_subdirectory(misc)			# Builds - watchdog;iplfox;foxcreate;foxsizes

#create foxsizesc.h and foxsizeso.h 
set(MAKE_CMD "${CMAKE_CURRENT_SOURCE_DIR}/makeHeaders.sh")
MESSAGE("COMMAND(to make foxsize headers): ${MAKE_CMD} ${CMAKE_CURRENT_SOURCE_DIR} ${OPEN_FOX_INC_DIR}")
execute_process(COMMAND ${MAKE_CMD} ${CMAKE_CURRENT_SOURCE_DIR} ${OPEN_FOX_INC_DIR}
   	RESULT_VARIABLE CMD_ERROR
      	OUTPUT_FILE CMD_OUTPUT)
MESSAGE( STATUS "CMD_ERROR: " ${CMD_ERROR})
MESSAGE( STATUS "CMD_OUTPUT: " ${CMD_OUTPUT})

# set LD_LIBRARY_PATH to .
set (ENV{LD_LIBRARY_PATH} ".")
#set(MAKE_CMD "${CMAKE_CURRENT_SOURCE_DIR}/callSetEnv.sh ${CMAKE_CURRENT_SOURCE_DIR}")
#MESSAGE("COMMAND(to make set Environment): ${MAKE_CMD}")
#execute_process(COMMAND ${MAKE_CMD}   	
#	RESULT_VARIABLE CMD_ERROR
#     	OUTPUT_FILE CMD_OUTPUT)
#MESSAGE( STATUS "CMD_ERROR: " ${CMD_ERROR})
#MESSAGE( STATUS "CMD_OUTPUT: " ${CMD_OUTPUT})


MESSAGE(STATUS "The Fox is being built as: ****    ${FN}    ****")



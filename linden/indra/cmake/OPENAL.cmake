# -*- cmake -*-

set(OPENAL ON CACHE BOOL "Enable OpenAL")


if (OPENAL)

  # message(STATUS "Building with OpenAL audio support")

  # OPENAL_LIB

  if (WINDOWS)
  find_library(OPENAL_LIB
    NAMES openal openal32 OpenAL OpenAL32 wrap_oal
    PATHS ${CMAKE_SOURCE_DIR}/../libraries/i686-win32/lib/release
    )

  else (WINDOWS)
  find_library(OPENAL_LIB
    NAMES openal openal32 OpenAL OpenAL32 wrap_oal
    PATHS ${ARCH_PREBUILT_DIRS_RELEASE}
    )
  endif (WINDOWS)
  
  if (NOT OPENAL_LIB)
    message(FATAL_ERROR "OpenAL not found!")
  else (NOT OPENAL_LIB)
    # message(STATUS "OpenAL found: ${OPENAL_LIB}")
  endif (NOT OPENAL_LIB)



  # OPENAL_INCLUDE_DIR

  find_path(OPENAL_INCLUDE_DIR
    NAMES al.h
    PATHS ${LIBS_PREBUILT_DIR}/include/AL /usr/include/AL
    )

  if (NOT OPENAL_INCLUDE_DIR)
    message(FATAL_ERROR "al.h not found!")
  else (NOT OPENAL_INCLUDE_DIR)
    # message(STATUS "al.h found in: ${OPENAL_INCLUDE_DIR}")
  endif (NOT OPENAL_INCLUDE_DIR)



  # ALUT_LIB

  if (WINDOWS)
   find_library(ALUT_LIB
   NAMES alut freealut
   PATHS ${CMAKE_SOURCE_DIR}/../libraries/i686-win32/lib/release
   )
  
  else (WINDOWS) 
  find_library(ALUT_LIB
    NAMES alut freealut
    PATHS ${ARCH_PREBUILT_DIRS_RELEASE}
    )
  endif (WINDOWS)

  if (NOT ALUT_LIB)
    message(FATAL_ERROR "ALUT not found!")
  else (NOT ALUT_LIB)
    # message(STATUS "ALUT found: ${ALUT_LIB}")
  endif (NOT ALUT_LIB)



  # ALUT_INCLUDE_DIR

  find_path(ALUT_INCLUDE_DIR
    NAMES alut.h
    PATHS ${LIBS_PREBUILT_DIR}/include/AL /usr/include/AL
    )

  if (NOT ALUT_INCLUDE_DIR)
    message(FATAL_ERROR "alut.h not found!")
  else (NOT ALUT_INCLUDE_DIR)
    # message(STATUS "alut.h found in: ${ALUT_INCLUDE_DIR}")
  endif (NOT ALUT_INCLUDE_DIR)



  set(OPENAL_LIBRARIES
    ${OPENAL_LIB}
    ${ALUT_LIB}
    )

  set(OPENAL_INCLUDE_DIRS
    ${OPENAL_INCLUDE_DIR}
    ${ALUT_INCLUDE_DIR}
    )
  

  set(OPENAL_FOUND TRUE CACHE BOOL
    "Found OpenAL and ALUT libraries successfully"
    )

endif (OPENAL)

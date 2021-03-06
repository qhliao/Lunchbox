
# Copyright (c) 2012 Stefan Eilemann <eile@eyescale.ch>

update_file(${CMAKE_CURRENT_SOURCE_DIR}/version.in.h
  ${OUTPUT_INCLUDE_DIR}/lunchbox/version.h)

set(LUNCHBOX_DEFINES)

if(LUNCHBOX_USE_BOOST)
  list(APPEND LUNCHBOX_DEFINES LUNCHBOX_USE_BOOST)
endif()

if(LUNCHBOX_OPENMP_USED)
  list(APPEND LUNCHBOX_DEFINES LUNCHBOX_USE_OPENMP)
endif(LUNCHBOX_OPENMP_USED)

if(HWLOC_FOUND)
  list(APPEND LUNCHBOX_DEFINES LUNCHBOX_USE_HWLOC)
endif(HWLOC_FOUND)

if(DNSSD_FOUND)
  list(APPEND LUNCHBOX_DEFINES LUNCHBOX_USE_DNSSD)
endif()

if(WIN32)
  list(APPEND LUNCHBOX_DEFINES WIN32 WIN32_API WIN32_LEAN_AND_MEAN)
  set(ARCH Win32)
endif(WIN32)

if(APPLE)
  list(APPEND LUNCHBOX_DEFINES Darwin)
  set(ARCH Darwin)
endif(APPLE)

if(CMAKE_SYSTEM_NAME MATCHES "Linux")
  list(APPEND LUNCHBOX_DEFINES Linux)
  set(ARCH Linux)
endif(CMAKE_SYSTEM_NAME MATCHES "Linux")

set(DEFINES_FILE ${OUTPUT_INCLUDE_DIR}/lunchbox/defines${ARCH}.h)
set(DEFINES_FILE_IN ${CMAKE_CURRENT_BINARY_DIR}/defines${ARCH}.h.in)
set(OPTIONS_CMAKE ${CMAKE_BINARY_DIR}/options.cmake)

file(WRITE ${DEFINES_FILE_IN}
  "#ifndef LUNCHBOX_DEFINES_${ARCH}_H\n"
  "#define LUNCHBOX_DEFINES_${ARCH}_H\n\n"
  )
file(WRITE ${OPTIONS_CMAKE} "# Optional modules enabled during build\n")

foreach(DEF ${LUNCHBOX_DEFINES})
  file(APPEND ${DEFINES_FILE_IN}
    "#ifndef ${DEF}\n"
    "#  define ${DEF}\n"
    "#endif\n"
    )
  if(DEF MATCHES "LUNCHBOX")
    file(APPEND ${OPTIONS_CMAKE} "set(${DEF} ON)\n")
  endif()
endforeach(DEF ${LUNCHBOX_DEFINES})

file(APPEND ${DEFINES_FILE_IN}
  "\n#endif /* LUNCHBOX_DEFINES_${ARCH}_H */\n"
  )
update_file(${DEFINES_FILE_IN} ${DEFINES_FILE})

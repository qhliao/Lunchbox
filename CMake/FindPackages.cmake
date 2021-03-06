# generated by Buildyard, do not edit.

find_package(HWLOC 1.4.0)
if(HWLOC_FOUND)
  set(HWLOC_name HWLOC)
elseif(HWLOC_FOUND)
  set(HWLOC_name HWLOC)
endif()
if(HWLOC_name)
  add_definitions(-DLUNCHBOX_USE_HWLOC)
  link_directories(${${HWLOC_name}_LIBRARY_DIRS})
  include_directories(${${HWLOC_name}_INCLUDE_DIRS})
endif()

find_package(DNSSD )
if(DNSSD_FOUND)
  set(DNSSD_name DNSSD)
elseif(DNSSD_FOUND)
  set(DNSSD_name DNSSD)
endif()
if(DNSSD_name)
  add_definitions(-DLUNCHBOX_USE_DNSSD)
  link_directories(${${DNSSD_name}_LIBRARY_DIRS})
  include_directories(${${DNSSD_name}_INCLUDE_DIRS})
endif()

find_package(Boost 1.41.0 REQUIRED serialization)
if(Boost_FOUND)
  set(Boost_name Boost)
elseif(BOOST_FOUND)
  set(Boost_name BOOST)
endif()
if(Boost_name)
  add_definitions(-DLUNCHBOX_USE_BOOST)
  link_directories(${${Boost_name}_LIBRARY_DIRS})
  include_directories(SYSTEM ${${Boost_name}_INCLUDE_DIRS})
endif()


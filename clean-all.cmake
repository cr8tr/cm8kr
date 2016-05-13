add_custom_target(clean-cmake-files
  COMMAND ${CMAKE_COMMAND} -P clean-all.cmake)

# clean-all.cmake
set(cmake_generated ${CMAKE_BINARY_DIR}/CMakeCache.txt
  ${CMAKE_BINARY_DIR}/cmake_install.cmake  
  ${CMAKE_BINARY_DIR}/Makefile
  ${CMAKE_BINARY_DIR}/CMakeFiles
)

foreach(file ${cmake_generated})
  if (EXISTS ${file})
    MESSAGE(STATUS ${file})
    #    file(REMOVE_RECURSE ${file})
  endif()
endforeach(file)

add_custom_target(clean-all
     COMMAND ${CMAKE_BUILD_TOOL} clean 
     COMMAND ${CMAKE_COMMAND} -P clean-all.cmake
)

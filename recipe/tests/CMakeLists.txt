cmake_minimum_required(VERSION 3.16)

project(test_mdspan CXX)

# Find the mdspan package
find_package(mdspan CONFIG REQUIRED)

# Create test executable
add_executable(test_mdspan test_mdspan.cpp)

# Link against mdspan
target_link_libraries(test_mdspan PRIVATE std::mdspan)

# Set C++ standard
set_property(TARGET test_mdspan PROPERTY CXX_STANDARD 20)
set_property(TARGET test_mdspan PROPERTY CXX_STANDARD_REQUIRED ON)

add_executable(test_kokkos_mdspan test_kokkos_mdspan.cpp)
target_link_libraries(test_kokkos_mdspan PRIVATE mdspan::mdspan)
set_property(TARGET test_kokkos_mdspan PROPERTY CXX_STANDARD 20)
set_property(TARGET test_kokkos_mdspan PROPERTY CXX_STANDARD_REQUIRED ON)

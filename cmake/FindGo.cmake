# Locate the Go compiler and set Go_FOUND to TRUE if found.
find_program(GO_EXECUTABLE NAMES go)
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Go REQUIRED_VARS GO_EXECUTABLE)


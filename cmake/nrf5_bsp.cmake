# MIT License

# Copyright (c) 2020 Polidea

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Boards
add_library(nrf5_boards OBJECT EXCLUDE_FROM_ALL
  "${NRF5_SDK_PATH}/components/boards/boards.c"
)
target_include_directories(nrf5_boards PUBLIC
  "${NRF5_SDK_PATH}/components/libraries/util"
  "${NRF5_SDK_PATH}/components/boards"
)
if(NRF5_BOARD)
  target_compile_definitions(nrf5_boards PUBLIC ${NRF5_BOARD_DEFINE})
endif()
target_link_libraries(nrf5_boards PUBLIC nrf5_mdk nrf5_soc nrf5_nrfx_hal)

# Board Support Package
add_library(nrf5_bsp OBJECT EXCLUDE_FROM_ALL
  "${NRF5_SDK_PATH}/components/libraries/bsp/bsp.c"
)
target_include_directories(nrf5_bsp PUBLIC
  "${NRF5_SDK_PATH}/components/libraries/bsp"
)
target_link_libraries(nrf5_bsp PUBLIC nrf5_boards nrf5_app_button)

# BSP Button BLE
add_library(nrf5_bsp_btn_ble OBJECT EXCLUDE_FROM_ALL
  "${NRF5_SDK_PATH}/components/libraries/bsp/bsp_btn_ble.c"
)
target_include_directories(nrf5_bsp_btn_ble PUBLIC
  "${NRF5_SDK_PATH}/components/libraries/bsp"
)
target_link_libraries(nrf5_bsp_btn_ble PUBLIC nrf5_boards nrf5_app_button)
# **FPGA Mouse Click Counter**

## **Overview**
This project implements a **mouse click counter** on an **FPGA** using a **Basys 3 board**. It tracks user clicks and displays the count on a **7-segment display (SSD)**. The functionality of the mouse buttons can be reversed using a switch.

## **Features**
- **Left-click → Increments the counter**
- **Right-click → Decrements the counter**
- **RESET button → Resets the display to "0000"**
- **IS_LEFT LED → Indicates that left-click increments and right-click decrements**
- **REVERSE switch → Swaps the mouse button functions (left-click decrements, right-click increments, and IS_LEFT LED turns off)**

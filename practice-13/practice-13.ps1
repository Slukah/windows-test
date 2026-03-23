#!/bin/bash

# Function to display the sub-menu after calculation
sub_menu() {
    while true; do
        echo ""
        echo "Please select the next option"
        echo ""
        echo "1: Return to Main Menu"
        echo "2: Exit"
        echo ""
        read -p "Enter your choice: " sub_choice

        case $sub_choice in
            1) main_menu ;;
            2) echo "Exiting..."; exit 0 ;;
            *) echo -e "\e[31mEnter correct option\e[0m" ;;
        esac
    done
}

# Function to calculate Area of Square
area_square() {
    clear
    echo -e "\e[33m         Area of Square\e[0m"
    echo ""
    read -p "Enter the side of the square: " side
    area=$((side * side))
    echo -e "\e[32mArea of the square : $area\e[0m"
    sub_menu
}

# Function to calculate Area of Rectangle
area_rectangle() {
    clear
    echo -e "\e[33m         Area of Rectangle\e[0m"
    echo ""
    read -p "Enter the length of the rectangle: " length
    read -p "Enter the width of the rectangle: " width
    area=$((length * width))
    echo -e "\e[32mArea of the rectangle : $area\e[0m"
    sub_menu
}

# Function to calculate Area of Circle
area_circle() {
    clear
    echo -e "\e[33m         Area of Circle\e[0m"
    echo ""
    read -p "Enter the radius of the circle: " radius
    area=$(awk "BEGIN {printf \"%.2f\", 3.14159 * $radius * $radius}")
    echo -e "\e[32mArea of the circle : $area\e[0m"
    sub_menu
}

# Function to calculate Area of Triangle
area_triangle() {
    clear
    echo -e "\e[33m         Area of Triangle\e[0m"
    echo ""
    read -p "Enter the base of the triangle: " base
    read -p "Enter the height of the triangle: " height
    area=$(awk "BEGIN {printf \"%.2f\", 0.5 * $base * $height}")
    echo -e "\e[32mArea of the triangle : $area\e[0m"
    sub_menu
}

# Main Menu function
main_menu() {
    clear
    echo -e "\e[33m         Area Calculator\e[0m"
    echo ""
    echo -e "\e[33m           Main Menu\e[0m"
    echo ""
    echo -e "\e[32mPlease select the option to perform the respective task\e[0m"
    echo ""
    echo -e "\e[32m1: Area of Square"
    echo "2: Area of Rectangle"
    echo "3: Area of Circle"
    echo "4: Area of Triangle"
    echo -e "5: Exit\e[0m"
    echo ""
    read -p "Enter your choice: " choice

    case $choice in
        1) area_square ;;
        2) area_rectangle ;;
        3) area_circle ;;
        4) area_triangle ;;
        5) echo "Exiting..."; exit 0 ;;
        *) echo -e "\e[31mEnter correct option\e[0m"; sleep 1; main_menu ;;
    esac
}

# Start the script
main_menu
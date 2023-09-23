#!/bin/bash

# Initialize the tic-tac-toe board
board=(" " " " " " " " " " " " " " " " " ")

# Function to display the tic-tac-toe board
function display_board {

    clear
    echo " ${board[0]} | ${board[1]} | ${board[2]}"
    echo "-----------"
    echo " ${board[3]} | ${board[4]} | ${board[5]}"
    echo "-----------"
    echo " ${board[6]} | ${board[7]} | ${board[8]}"
}

# Function to check for a win
function check_win {
    local win=false

    # Check rows, columns, and diagonals for a win
    if [[ "${board[0]}" != " " && "${board[0]}" == "${board[1]}" && "${board[1]}" == "${board[2]}" ]]; then
        win=true
    elif [[ "${board[3]}" != " " && "${board[3]}" == "${board[4]}" && "${board[4]}" == "${board[5]}" ]]; then
        win=true
    elif [[ "${board[6]}" != " " && "${board[6]}" == "${board[7]}" && "${board[7]}" == "${board[8]}" ]]; then
        win=true
    elif [[ "${board[0]}" != " " && "${board[0]}" == "${board[3]}" && "${board[3]}" == "${board[6]}" ]]; then
        win=true
    elif [[ "${board[1]}" != " " && "${board[1]}" == "${board[4]}" && "${board[4]}" == "${board[7]}" ]]; then
        win=true
    elif [[ "${board[2]}" != " " && "${board[2]}" == "${board[5]}" && "${board[5]}" == "${board[8]}" ]]; then
        win=true
    elif [[ "${board[0]}" != " " && "${board[0]}" == "${board[4]}" && "${board[4]}" == "${board[8]}" ]]; then
        win=true
    elif [[ "${board[2]}" != " " && "${board[2]}" == "${board[4]}" && "${board[4]}" == "${board[6]}" ]]; then
        win=true
    fi

    echo $win
}

# Function to check for a draw
function check_draw {
    local draw=true

    # Check if there are any empty spaces left
    for cell in "${board[@]}"; do
        if [[ "$cell" == " " ]]; then
            draw=false
            break
        fi
    done

    echo $draw
}

# Main game loop
player="X"
while true; do
    display_board
    echo "Player $player's turn (Enter row and column, e.g., 1 2):"
    read -r row col

    index=$((row * 3 + col - 4))

    if [[ "$index" -ge 0 && "$index" -lt 9 && "${board[$index]}" == " " ]]; then
        board[$index]=$player
    else
        echo "Invalid move. Try again."
        continue
    fi

    if $(check_win); then
        display_board
        echo "Player $player wins! Congratulations!"
        break
    elif $(check_draw); then
        display_board
        echo "It's a draw! The game is over."
        break
    fi

    
    if [[ "$player" == "X" ]]; then
        player="O"
    else
        player="X"
    fi
done


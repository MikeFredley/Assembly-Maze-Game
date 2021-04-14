; Michael Fredley
; CIS 253 - Dr. Wyatt
; MAZE
; Draws a maze design that the user would then be able to move a character around inside to reach a goal


include 'emu8086.inc'

org 100h

jmp CODE  

          ; TO CHANGE TO THE MAZE YOU WANT TO USE CHANGE THE NAME TO 'MAZE' AND MAKE SURE THE OTHER NAMES ARE NOT
          ; THEN CHANGE THE RSIZE AND CSIZE TO WHATS IN THE OTHER COMMENTS
          
          ; Big Maze rsize = 50 csize = 19
     maze DB 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
          DB 1,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
          DB 1,0,1,0,1,1,1,0,1,0,0,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1
          DB 1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
          DB 1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1
          DB 1,0,0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
          DB 1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1
          DB 1,0,0,0,0,0,0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1
          DB 1,0,1,1,1,1,1,1,1,0,1,0,1,0,1,0,1,0,1,0,0,0,1,1,1,0,1,0,1,0,1,0,1,0,1,2,1,0,1,1,1,1,1,1,1,1,1,1,1,1
          DB 1,0,0,0,0,0,0,0,0,0,1,0,1,0,1,0,1,0,1,0,1,1,1,0,1,0,1,0,0,0,1,0,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1
          DB 1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,0,1,0,1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,0,0,0,0,0,1,1,1,1,1,1,1,1,0,1,0,1
          DB 1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,0,1
          DB 1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,0,1,1,1,1,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1
          DB 1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,1,1,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,0,0,1
          DB 1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,0,1,1,1,1,0,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1
          DB 1,0,1,0,1,0,1,0,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1
          DB 1,0,0,0,1,0,1,0,0,0,0,0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
          DB 1,0,1,1,1,0,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1
          DB 1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
          DB 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
     
          ; Medium Maze rsize = 12 csize = 11 
    maze2 DB 1,1,1,1,1,1,1,1,1,1,1,1
          DB 1,0,1,0,0,0,0,0,0,0,0,1
          DB 1,0,1,0,1,1,1,1,1,1,0,1
          DB 1,0,1,0,1,0,0,0,0,1,0,1
          DB 1,0,1,0,1,0,1,1,0,1,0,1
          DB 1,0,1,0,1,0,2,1,0,1,0,1
          DB 1,0,1,0,1,0,0,1,0,1,0,1
          DB 1,0,1,0,1,1,1,1,0,1,0,1
          DB 1,0,1,0,0,0,0,0,0,1,0,1
          DB 1,0,1,1,1,1,1,1,1,1,0,1
          DB 1,0,0,0,0,0,0,0,0,0,0,1
          DB 1,1,1,1,1,1,1,1,1,1,1,1 
          
          ;Small Maze  rsize = 5 csize = 3
    maze3 DB 1,1,1,1,1
          DB 1,0,1,2,1
          DB 1,0,0,0,1
          DB 1,1,1,1,1
          
    rsize = 12                 
    csize = 11               
    
 
CODE:
    call DRAW
    call MOVE
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Code that deals with drawing the maze ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PROC DRAW
    cursoroff   ; Turns the cursor off on the console
    xor AX, AX  ; Clears AX
    mov BH, 0   ; Sets up the X coordinate
    mov BL, 0   ; Sets up the Y coordinate
    gotoxy BH, BL   ; Sets the output to go to the set coordinates
    
    lea SI, maze2  ; Sets up a pointer to point to the maze
    mov CX, rsize ; Moves the row size to CX to set how long the loop in the ROW procedure will run
    call ROW      ; Calls the row procedure to output the first row of the maze
    mov cx, csize ; Moves the column size into CX to set how long the Loops loops will run    
    call LOOPS    ; Calls the LOOPS procedure
    ret
    
PROC LOOPS    
    add SI, rsize ; sets the pointer to point at the next row in the maze
    push CX       ; Pushes CX onto the stack to preserve how long LOOPS will run
    mov CX, rsize ; Moves the row size to CX to set how long the loop in the ROW procedure will run
    mov BH, 0     ; Sets the X coordinate for the output
    add BL, 1     ; Adds one to the Y coordinate to make the output move down
    gotoxy BH, BL ; Gos to the newly set coordinate   
    call ROW      ; Pops the original CX off of the stack so that loops does not run too many times
    pop CX 
   loop LOOPS
   ret
endp                           

     


PROC row
    ; Pushes CX AX and SI onto the stack to prevent unwanted changes          
    push CX
    push AX
    push SI
  TOP:
      mov AL, 32  ; moves 32 into AL - the value for a blank space            
      cmp [SI], 0 ; If SI is pointing to a 0 within a maze
      je GO       ; It calls the GO label
      mov AL, 219 ; If SI is not pointing to a 0 it moves 219 into AL - the value for a wall character
      cmp [SI], 2
      je END      
  GO: putc AL     ; Outputs AL into the console
      inc SI      ; Increments the pointer to point to the next location in the maze
      loop TOP    ; Loops the procedure until the row is done being outputted
    ; Pops CX AX and SI off of the stack
    pop SI
    pop AX
    pop CX 
      ret
  END: mov AL, 83
       jmp GO
    
   
ret
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Code that deals with character movement ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    

PROC MOVE
    lea SI, maze     ; Resets the pointer to the front of the maze
    mov BH, 1        ; Sets the x coordinate to 1
    mov BL, 1        ; Sets the x coordinate to 1
    gotoxy BH, BL    ; Moves the cursor to the set x,y coordinates
    putc 1           ; Puts the Character in the position of the cursor
    add SI, rsize+1  ; Moves the pointer to the position of the character
    
LUP: 
    cmp [SI], 2      ; Checks for a 2 in the maze
    je DUN           ; Jumps to the DUN label if it is a 2
    mov ah, 00h      ; Interrupt to get the users input
    int 16h
            
R: cmp al, 'd'       ; Checks for a d input
    jne L            ; Jumps to the next input condition if not d
    cmp [SI + 1], 1  ; Compares the pointer to the next possible position
    je ding          ; If the next position is equal to the wall value it jumps to the ding label
    gotoxy BH, BL    ; Sets the cursor to the characer position
    putc 32          ; Puts a blank space into its postion
    inc BH           ; Increments the x coordinate to move right
    gotoxy BH, BL    ; Moves the cursor to the new position
    putc 1           ; Writes the character into the new position
    inc SI           ; Moves the pointer to the new position
jmp LUP              ; Jumps back to the top


L: cmp al, 'a'       ; Checks for an a input                                                      
    jne U            ; Jumps to the next input condition if not a                                
    cmp [SI - 1], 1  ; Compares the pointer to the next possible position                                                                 
    je ding          ; If the next position is equal to the wall value it jumps to the ding label
    gotoxy BH, BL    ; Sets the cursor to the characer position                                  
    putc 32          ; Puts a blank space into its postion                                       
    dec BH           ; Decrementss the x coordinate to move left                                               
    gotoxy BH, BL    ; Moves the cursor to the new position                                      
    putc 1           ; Writes the character into the new position                                
    dec SI           ; Moves the pointer to the new position                                     
jmp LUP              ; Jumps back to the top                                                     
                                                                                                 

U: cmp al, 'w'          ; Checks for a w input                                                      
    jne D               ; Jumps to the next input condition if not w                                
    cmp [SI - rsize], 1 ; Compares the pointer to the next possible position                        
    je ding             ; If the next position is equal to the wall value it jumps to the ding label
    gotoxy BH, BL       ; Sets the cursor to the characer position                                  
    putc 32             ; Puts a blank space into its postion                                       
    dec BL              ; Decrements the y coordinate to move up                                               
    gotoxy BH, BL       ; Moves the cursor to the new position                                      
    putc 1              ; Writes the character into the new position                                
    sub SI, rsize       ; Moves the pointer to the new position                                     
jmp LUP                 ; Jumps back to the top                                                     
                                                                                                    

D: cmp al, 's'          ; Checks for a s input                                                      
    jne ding            ; Jumps to the next input condition if not s                                
    cmp [SI + rsize], 1 ; Compares the pointer to the next possible position                        
    je ding             ; If the next position is equal to the wall value it jumps to the ding label
    gotoxy BH, BL       ; Sets the cursor to the characer position                                  
    putc 32             ; Puts a blank space into its postion                                       
    inc BL              ; Increments the y coordinate to move down                                               
    gotoxy BH, BL       ; Moves the cursor to the new position                                      
    putc 1              ; Writes the character into the new position                                
    add SI, rsize       ; Moves the pointer to the new position                                     
jmp LUP                 ; Jumps back to the top                                                     
ret                                                                                                 

DING: putc 07           ; Causes the pc to beep 
jmp LUP

DUN:                    ; Moves to the bottom of the screen
   mov BH, 24           ; Writes victory message then ends program
   mov BL, 24
   gotoxy BH, BL
   print "Congradulations You Win!"
 Ret

ret

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS

end



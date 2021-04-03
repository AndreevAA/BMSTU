; Задача: Удалить столбец цифровой матрицы с наименьшим элементом
;---------------------
EXTRN READ_SIZE:NEAR
EXTRN READ_MAT:NEAR
EXTRN PRINT_MAT:NEAR
EXTRN DEL_ROW:NEAR
;---------------------
PUBLIC MATRIX_HEIGHT
PUBLIC MATRIX_WIDTH
PUBLIC MAT
;---------------------
STKS SEGMENT PARA STACK 'STACK'
    DB 200 DUP (0)
STKS ENDS
;---------------------
DATAS SEGMENT PARA PUBLIC 'DATA'
    MATRIX_HEIGHT DB 1				; Высота матрицы
    MATRIX_WIDTH DB 1				; Ширина матрицы
    MAT DB 81 DUP ("0")				; Заполняю цифровую матрицу 9х9 нулями
DATAS ENDS
;---------------------
CODES SEGMENT PARA PUBLIC 'CODE'
    ASSUME DS:DATAS, CS:CODES
;---------------------
MAIN:
    CALL READ_SIZE					; Чтение размеров матрицы
    CALL READ_MAT					; Чтение матрицы
    CALL DEL_ROW					; Удаление строки
    CALL PRINT_MAT					; Вывод матрицы

    MOV AX, 4C00H
    INT 21H
CODES ENDS
END MAIN

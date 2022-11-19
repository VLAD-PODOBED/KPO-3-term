.586P
.MODEL FLAT, STDCALL
includelib kernel32.lib

ExitProcess PROTO : DWORD
MessageBoxA PROTO : DWORD, : DWORD, : DWORD, : DWORD

.STACK 4098

.CONST

.DATA
MB_OK	EQU 0
STR1	DB "ѕодобед ¬ладислав √еоргиевич 0 курс 6 группа", 0
STR2	DB "¬ регистре EBX находитс€ 0 (есть 0)", 0
STR3	DB "¬ регистре EBX находитс€ 1 (нету 0)", 0
HW		DD ?

myDoubles DWORD 1, 2, 3, 4, 5, 6   
Array	  BYTE 8, 7, 9, 0, 1, 2, 4

.CODE

main PROC
START: 
			mov esi,0   ;копирует данные из операнда-источника в операнд-получатель
			mov eax, myDoubles[esi+4]
			mov edx, [myDoubles + esi]
			
			xor eax, eax  ; оманда XOR выполн€ет операцию исключающего »Ћ» с соответствующими парами битов операндов команды и помещает результат в операнд-получатель.
			xor ebx, ebx

			add al, [Array]
			add al, [Array + 1]
			add al, [Array + 2]
			add al, [Array + 3]
			add al, [Array + 4]
			add al, [Array + 5]
			add al, [Array + 6]

	SC: 
			mov ecx, lengthof Array - 1 ;LENGTHOF определ€ет количество элементов в массиве,перечисленного в одной строке
			mov ebx, 1
	Cycl:
			cmp [Array + ecx], 0 ; оманда вычитает исходный операнд из операнда получател€ и устанавливает флаги,операци€ сравнени€
			jne False  ;переход, если не равны операнды
			je	True   ;переход, если равны операнды
	True:	
			mov	ebx, 0
			jmp EC; выполн€ет безусловный переход в указанное место
	False:
			loop Cycl ;уменьшаем регистр на 1 и сравниваем с 0,если не равен 0,то переход по указанной метке
	EC:

	Check:
			cmp ebx, 0 ;операци€ сравнени€
			je	ZR     ;переход если операнды равны

			invoke MessageBoxA, HW, OFFSET STR3, OFFSET STR1, MB_OK
			jmp EndCheck ;безусловный переход
	ZR:
			invoke MessageBoxA, HW, OFFSET STR2, OFFSET STR1, MB_OK
	EndCheck:
	push	0     ;код возврата
	call ExitProcess  ;завершени€ процесса винды
main ENDP   

end main   
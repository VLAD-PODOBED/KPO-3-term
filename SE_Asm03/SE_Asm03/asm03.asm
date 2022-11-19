.586P
.MODEL FLAT, STDCALL
includelib kernel32.lib

ExitProcess PROTO : DWORD
MessageBoxA PROTO : DWORD, : DWORD, : DWORD, : DWORD

.STACK 4098

.CONST

.DATA
MB_OK	EQU 0
STR1	DB "������� ��������� ���������� 0 ���� 6 ������", 0
STR2	DB "� �������� EBX ��������� 0 (���� 0)", 0
STR3	DB "� �������� EBX ��������� 1 (���� 0)", 0
HW		DD ?

myDoubles DWORD 1, 2, 3, 4, 5, 6   
Array	  BYTE 8, 7, 9, 0, 1, 2, 4

.CODE

main PROC
START: 
			mov esi,0   ;�������� ������ �� ��������-��������� � �������-����������
			mov eax, myDoubles[esi+4]
			mov edx, [myDoubles + esi]
			
			xor eax, eax  ;������� XOR ��������� �������� ������������ ��� � ���������������� ������ ����� ��������� ������� � �������� ��������� � �������-����������.
			xor ebx, ebx

			add al, [Array]
			add al, [Array + 1]
			add al, [Array + 2]
			add al, [Array + 3]
			add al, [Array + 4]
			add al, [Array + 5]
			add al, [Array + 6]

	SC: 
			mov ecx, lengthof Array - 1 ;LENGTHOF ���������� ���������� ��������� � �������,�������������� � ����� ������
			mov ebx, 1
	Cycl:
			cmp [Array + ecx], 0 ;������� �������� �������� ������� �� �������� ���������� � ������������� �����,�������� ���������
			jne False  ;�������, ���� �� ����� ��������
			je	True   ;�������, ���� ����� ��������
	True:	
			mov	ebx, 0
			jmp EC; ��������� ����������� ������� � ��������� �����
	False:
			loop Cycl ;��������� ������� �� 1 � ���������� � 0,���� �� ����� 0,�� ������� �� ��������� �����
	EC:

	Check:
			cmp ebx, 0 ;�������� ���������
			je	ZR     ;������� ���� �������� �����

			invoke MessageBoxA, HW, OFFSET STR3, OFFSET STR1, MB_OK
			jmp EndCheck ;����������� �������
	ZR:
			invoke MessageBoxA, HW, OFFSET STR2, OFFSET STR1, MB_OK
	EndCheck:
	push	0     ;��� ��������
	call ExitProcess  ;���������� �������� �����
main ENDP   

end main   
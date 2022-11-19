#include "stdafx.h"
#include "In.h"
#include "Error.h"
namespace In
{
	IN getin(wchar_t infile[])
	{
		IN in;
		in.ignor = 0; in.lines = 1; in.size = 0;
		int col = 0;
		ifstream file;
		unsigned char text[1024] = "";
		unsigned char symbol;
		int i = 0;
		file.open(infile);
		/*symbol = file.get();*/
		while (i < IN_MAX_LEN_TEXT)
		{
			//symbol = file.get();
			char x = file.get();
			symbol = x;
			if (file.eof())
			{
				break;
			}
			if (symbol == IN_CODE_ENDL) // не считает
			{
				in.lines++;
				col = 0;

				text[i] = '|';
				i++;

				continue;
			}
			else if (in.code[(int)(symbol)] == in.T)
			{
				text[i] = symbol;
				col++;
				in.size++;
				i++;
				continue;
			}
			else if (symbol == in.I)
			{
				in.ignor++;
				in.size++;
				i++;
				continue;
			}
			else if (symbol == in.F)
			{
				throw ERROR_THROW_IN(111, in.lines, in.size);
			}
			else
			{

				text[i] = in.code[(int)(symbol)];
				in.size++;
				i++;
				continue;
			}

		}
		text[i] = '\0';
		file.close();
		in.text = text;
		return in;
	}
}
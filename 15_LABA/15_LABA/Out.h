#pragma once
#include "Error.h"
#include "stdafx.h"
#include "Parm.h"
#include "In.h"

namespace Out
{
	struct OUT
	{
		wchar_t outfile[PARM_MAX_SIZE];
		ofstream* stream;
	};
	static const OUT INITOUT{ L"", NULL };
	OUT getout(wchar_t outfile[]);
	void  WriteOut(OUT out, In::IN in);
	void WriteError(OUT out, Error::ERROR error);
	void Close(OUT out);
}
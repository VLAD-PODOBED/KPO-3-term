#include "Out.h"

namespace Out
{
    OUT getout(wchar_t outfile[])
    {
        OUT out;

        out.stream = new ofstream;
        out.stream->open(outfile);

        if (out.stream->fail())
            throw ERROR_THROW(112);
        wcscpy_s(out.outfile, outfile);
        return out;
    }

    void WriteOut(OUT out, In::IN in)
    {
        *out.stream << in.text;
    }

    void WriteError(OUT out, Error::ERROR error)
    {
        if (out.stream)
        {
            *out.stream << "\nОшибка " << error.id
                << ": " << error.message
                << "\nСтрока " << error.inext.line
                << " позиция " << error.inext.col << endl;
            Close(out);
        }
        else
        {
            cout << "\nОшибка " << error.id
                << ": " << error.message
                << "\nСтрока " << error.inext.line
                << " позиция " << error.inext.col << endl;
        }
    }
    void Close(OUT out)
    {
        out.stream->close();
        delete out.stream;
    }
}
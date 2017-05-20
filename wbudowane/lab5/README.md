# Lab 5.

Labek polega na przyspieszeniu wpisywania wartości konkretnych bitów do pamięci, fan dynamicznie typowanych języków here, nie szanuje takich optymalizacji :P

Zadanie 1: proszę wyznaczyć adres 8 bitu rejestru pod adresem 0x2000 0300.
    - aye capitan,
```
[Desktop] cat bit_bang_theory.py                                               22:16:33
ALIAS_BASE              = 0x22000000
BIT_BAND_BASE           = 0x20000000
BIT_BAND_MEM_ADR        = 0x20000300
BIT                     = 0x00000008

RESULT = ALIAS_BASE + ( 32 * (BIT_BAND_MEM_ADR - BIT_BAND_BASE) ) + BIT * 4
print('0x{:x}'.format(RESULT))
[Desktop] python3 bit_bang_theory.py                                           22:17:19
0x22006020
```



OPCODES = [
    {"mnem": "BRK",          "code": "00",     "bus": ""},
    {"mnem": "ORA (p,X)",    "code": "01pp",   "bus": "r"},
    {"mnem": "ORA p",        "code": "05pp",   "bus": "r"},
    {"mnem": "ASL p",        "code": "06pp",   "bus": "rw"},
    {"mnem": "PHP",          "code": "08",     "bus": ""},
    {"mnem": "ORA #b",       "code": "09bb",   "bus": ""},
    {"mnem": "ASL A",        "code": "0A",     "bus": ""},
    {"mnem": "ORA t",        "code": "0Dtltm", "bus": "r"},
    {"mnem": "ASL t",        "code": "0Etltm", "bus": "rw"},
    {"mnem": "BPL r",        "code": "10rr",   "bus": "x"},
    {"mnem": "ORA (p),Y",    "code": "11pp",   "bus": "r"},
    {"mnem": "ORA p,X",      "code": "15pp",   "bus": "r"},
    {"mnem": "ASL p,X",      "code": "16pp",   "bus": "rw"},
    {"mnem": "CLC",          "code": "18",     "bus": ""},
    {"mnem": "ORA t,Y",      "code": "19tltm", "bus": "r"},
    {"mnem": "ORA t,X",      "code": "1Dtltm", "bus": "r"},
    {"mnem": "ASL t,X",      "code": "1Etltm", "bus": "rw"},
    {"mnem": "JSR t",        "code": "20tltm", "bus": "x"},
    {"mnem": "AND (p,X)",    "code": "21pp",   "bus": "r"},
    {"mnem": "BIT p",        "code": "24pp",   "bus": "r"},
    {"mnem": "AND p",        "code": "25pp",   "bus": "r"},
    {"mnem": "ROL p",        "code": "26pp",   "bus": "rw"},
    {"mnem": "PLP",          "code": "28",     "bus": "r"},
    {"mnem": "AND #b",       "code": "29bb",   "bus": ""},
    {"mnem": "ROL A",        "code": "2A",     "bus": ""},
    {"mnem": "BIT t",        "code": "2Ctltm", "bus": "r"},
    {"mnem": "AND t",        "code": "2Dtltm", "bus": "r"},
    {"mnem": "ROL t",        "code": "2Etltm", "bus": "rw"},
    {"mnem": "BMI r",        "code": "30rr",   "bus": "x"},
    {"mnem": "AND (p),Y",    "code": "31pp",   "bus": "r"},
    {"mnem": "AND p,X",      "code": "35pp",   "bus": "r"},
    {"mnem": "ROL p,X",      "code": "36pp",   "bus": "rw"},
    {"mnem": "SEC",          "code": "38",     "bus": ""},
    {"mnem": "AND t,Y",      "code": "39tltm", "bus": "r"},
    {"mnem": "AND t,X",      "code": "3Dtltm", "bus": "r"},
    {"mnem": "ROL t,X",      "code": "3Etltm", "bus": "rw"},
    {"mnem": "RTI",          "code": "40",     "bus": ""},
    {"mnem": "EOR (p,X)",    "code": "41pp",   "bus": "r"},
    {"mnem": "EOR p",        "code": "45pp",   "bus": "r"},
    {"mnem": "LSR p",        "code": "46pp",   "bus": "rw"},
    {"mnem": "PHA",          "code": "48",     "bus": ""},
    {"mnem": "EOR #b",       "code": "49bb",   "bus": ""},
    {"mnem": "LSR A",        "code": "4A",     "bus": ""},
    {"mnem": "JMP t",        "code": "4Ctltm", "bus": "x"},
    {"mnem": "EOR t",        "code": "4Dtltm", "bus": "r"},
    {"mnem": "LSR t",        "code": "4Etltm", "bus": "rw"},
    {"mnem": "BVC r",        "code": "50rr",   "bus": "x"},
    {"mnem": "EOR (p),Y",    "code": "51pp",   "bus": "r"},
    {"mnem": "EOR p,X",      "code": "55pp",   "bus": "r"},
    {"mnem": "LSR p,X",      "code": "56pp",   "bus": "rw"},
    {"mnem": "CLI",          "code": "58",     "bus": ""},
    {"mnem": "EOR t,Y",      "code": "59tltm", "bus": "r"},
    {"mnem": "EOR t,X",      "code": "5Dtltm", "bus": "r"},
    {"mnem": "LSR t,X",      "code": "5Etltm", "bus": "rw"},
    {"mnem": "RTS",          "code": "60",     "bus": ""},
    {"mnem": "ADC (p,X)",    "code": "61pp",   "bus": "r"},
    {"mnem": "ADC p",        "code": "65pp",   "bus": "r"},
    {"mnem": "ROR p",        "code": "66pp",   "bus": "rw"},
    {"mnem": "PLA",          "code": "68",     "bus": "r"},
    {"mnem": "ADC #b",       "code": "69bb",   "bus": ""},
    {"mnem": "ROR A",        "code": "6A",     "bus": ""},
    {"mnem": "JMP (t)",      "code": "6Ctltm", "bus": "x"},
    {"mnem": "ADC t",        "code": "6Dtltm", "bus": "r"},
    {"mnem": "ROR t",        "code": "6Etltm", "bus": "r"},
    {"mnem": "BVS r",        "code": "70rr",   "bus": "x"},
    {"mnem": "ADC (p),Y",    "code": "71pp",   "bus": "r"},
    {"mnem": "ADC p,X",      "code": "75pp",   "bus": "r"},
    {"mnem": "ROR p,X",      "code": "76pp",   "bus": "rw"},
    {"mnem": "SEI",          "code": "78",     "bus": ""},
    {"mnem": "ADC t,Y",      "code": "79tltm", "bus": "r"},
    {"mnem": "ADC t,X",      "code": "7Dtltm", "bus": "r"},
    {"mnem": "ROR t,X",      "code": "7Etltm", "bus": "rw"},
    {"mnem": "STA (p,X)",    "code": "81pp",   "bus": "w"},
    {"mnem": "STY p",        "code": "84pp",   "bus": "w"},
    {"mnem": "STA p",        "code": "85pp",   "bus": "w"},
    {"mnem": "STX p",        "code": "86pp",   "bus": "w"},
    {"mnem": "DEY",          "code": "88",     "bus": ""},
    {"mnem": "TXA",          "code": "8A",     "bus": ""},
    {"mnem": "STY t",        "code": "8Ctltm", "bus": "w"},
    {"mnem": "STA t",        "code": "8Dtltm", "bus": "w"},
    {"mnem": "STX t",        "code": "8Etltm", "bus": "w"},
    {"mnem": "BCC r",        "code": "90rr",   "bus": "x"},
    {"mnem": "STA (p),Y",    "code": "91pp",   "bus": "w"},
    {"mnem": "STY p,X",      "code": "94pp",   "bus": "w"},
    {"mnem": "STA p,X",      "code": "95pp",   "bus": "w"},
    {"mnem": "STX p,Y",      "code": "96pp",   "bus": "w"},
    {"mnem": "TYA",          "code": "98",     "bus": ""},
    {"mnem": "STA t,Y",      "code": "99tltm", "bus": "w"},
    {"mnem": "TXS",          "code": "9A",     "bus": ""},
    {"mnem": "STA t,X",      "code": "9Dtltm", "bus": "w"},
    {"mnem": "LDY #b",       "code": "A0bb",   "bus": ""},
    {"mnem": "LDA (p,X)",    "code": "A1pp",   "bus": "r"},
    {"mnem": "LDX #b",       "code": "A2bb",   "bus": ""},
    {"mnem": "LDY p",        "code": "A4pp",   "bus": "r"},
    {"mnem": "LDA p",        "code": "A5pp",   "bus": "r"},
    {"mnem": "LDX p",        "code": "A6pp",   "bus": "r"},
    {"mnem": "TAY",          "code": "A8",     "bus": ""},
    {"mnem": "LDA #b",       "code": "A9bb",   "bus": ""},
    {"mnem": "TAX",          "code": "AA",     "bus": ""},
    {"mnem": "LDY t",        "code": "ACtltm", "bus": "r"},
    {"mnem": "LDA t",        "code": "ADtltm", "bus": "r"},
    {"mnem": "LDX t",        "code": "AEtltm", "bus": "r"},
    {"mnem": "BCS r",        "code": "B0rr",   "bus": "x"},
    {"mnem": "LDA (p),Y",    "code": "B1pp",   "bus": "r"},
    {"mnem": "LDY p,X",      "code": "B4pp",   "bus": "r"},
    {"mnem": "LDA p,X",      "code": "B5pp",   "bus": "r"},
    {"mnem": "LDX p,Y",      "code": "B6pp",   "bus": "r"},
    {"mnem": "CLV",          "code": "B8",     "bus": ""},
    {"mnem": "LDA t,Y",      "code": "B9tltm", "bus": "r"},
    {"mnem": "TSX",          "code": "BA",     "bus": ""},
    {"mnem": "LDY t,X",      "code": "BCtltm", "bus": "r"},
    {"mnem": "LDA t,X",      "code": "BDtltm", "bus": "r"},
    {"mnem": "LDX t,Y",      "code": "BEtltm", "bus": "r"},
    {"mnem": "CPY #b",       "code": "C0bb",   "bus": ""},
    {"mnem": "CMP (p,X)",    "code": "C1pp",   "bus": "r"},
    {"mnem": "CPY p",        "code": "C4pp",   "bus": "r"},
    {"mnem": "CMP p",        "code": "C5pp",   "bus": "r"},
    {"mnem": "DEC p",        "code": "C6pp",   "bus": "rw"},
    {"mnem": "INY",          "code": "C8",     "bus": ""},
    {"mnem": "CMP #b",       "code": "C9bb",   "bus": ""},
    {"mnem": "DEX",          "code": "CA",     "bus": ""},
    {"mnem": "CPY t",        "code": "CCtltm", "bus": "r"},
    {"mnem": "CMP t",        "code": "CDtltm", "bus": "r"},
    {"mnem": "DEC t",        "code": "CEtltm", "bus": "rw"},
    {"mnem": "BNE r",        "code": "D0rr",   "bus": "x"},
    {"mnem": "CMP (p),Y",    "code": "D1pp",   "bus": "r"},
    {"mnem": "CMP p,X",      "code": "D5pp",   "bus": "r"},
    {"mnem": "DEC p,X",      "code": "D6pp",   "bus": "rw"},
    {"mnem": "CLD",          "code": "D8",     "bus": ""},
    {"mnem": "CMP t,Y",      "code": "D9tltm", "bus": "r"},
    {"mnem": "CMP t,X",      "code": "DDtltm", "bus": "r"},
    {"mnem": "DEC t,X",      "code": "DEtltm", "bus": "rw"},
    {"mnem": "CPX #b",       "code": "E0bb",   "bus": ""},
    {"mnem": "SBC (p,X)",    "code": "E1pp",   "bus": "r"},
    {"mnem": "CPX p",        "code": "E4pp",   "bus": "r"},
    {"mnem": "SBC p",        "code": "E5pp",   "bus": "r"},
    {"mnem": "INC p",        "code": "E6pp",   "bus": "rw"},
    {"mnem": "INX",          "code": "E8",     "bus": ""},
    {"mnem": "SBC #b",       "code": "E9bb",   "bus": ""},
    {"mnem": "NOP",          "code": "EA",     "bus": ""},
    {"mnem": "CPX t",        "code": "ECtltm", "bus": "r"},
    {"mnem": "SBC t",        "code": "EDtltm", "bus": "r"},
    {"mnem": "INC t",        "code": "EEtltm", "bus": "rw"},
    {"mnem": "BEQ r",        "code": "F0rr",   "bus": "x"},
    {"mnem": "SBC (p),Y",    "code": "F1pp",   "bus": "r"},
    {"mnem": "SBC p,X",      "code": "F5pp",   "bus": "r"},
    {"mnem": "INC p,X",      "code": "F6pp",   "bus": "rw"},
    {"mnem": "SED",          "code": "F8",     "bus": ""},
    {"mnem": "SBC t,Y",      "code": "F9tltm", "bus": "r"},
    {"mnem": "SBC t,X",      "code": "FDtltm", "bus": "r"},
    {"mnem": "INC t,X",      "code": "FEtltm", "bus": "rw"}
]

import cpu.cpu_common


class CPU_6502(cpu.cpu_common.CPU):

    def __init__(self):
        super().__init__(OPCODES)


SINGLETON = CPU_6502()


def get_cpu():
    return SINGLETON

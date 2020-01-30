import cpu.base_cpu

# http://www.keil.com/support/man/docs/is51/is51_opcodes.htm

OPCODES = [
    {"mnemonic":"NOP",              "code":"00",               "use":"",       },
    {"mnemonic":"AJMP p",           "code":"01pp",             "use":"code_11",   },
    {"mnemonic":"LJMP t",           "code":"02t1t0",           "use":"code",   },
    {"mnemonic":"RR A",             "code":"03",               "use":"",       },
    {"mnemonic":"INC A",            "code":"04",               "use":"",       },
    {"mnemonic":"INC p",            "code":"05pp",             "use":"data",       },
    {"mnemonic":"INC @R0",          "code":"06",               "use":"",       },
    {"mnemonic":"INC @R1",          "code":"07",               "use":"",       },
    {"mnemonic":"INC R0",           "code":"08",               "use":"",       },
    {"mnemonic":"INC R1",           "code":"09",               "use":"",       },
    {"mnemonic":"INC R2",           "code":"0A",               "use":"",       },
    {"mnemonic":"INC R3",           "code":"0B",               "use":"",       },
    {"mnemonic":"INC R4",           "code":"0C",               "use":"",       },
    {"mnemonic":"INC R5",           "code":"0D",               "use":"",       },
    {"mnemonic":"INC R6",           "code":"0E",               "use":"",       },
    {"mnemonic":"INC R7",           "code":"0F",               "use":"",       },
    {"mnemonic":"JBC b,r",          "code":"10bbrr",           "use":"b=data_bit, r=code_pcr",   },
    {"mnemonic":"ACALL p",          "code":"11pp",             "use":"code_11",   },
    {"mnemonic":"LCALL t",          "code":"12t1t0",           "use":"code",   },
    {"mnemonic":"RRC A",            "code":"13",               "use":"",       },
    {"mnemonic":"DEC A",            "code":"14",               "use":"",       },
    {"mnemonic":"DEC p",            "code":"15",               "use":"",       },
    {"mnemonic":"DEC @R0",          "code":"16",               "use":"",       },
    {"mnemonic":"DEC @R1",          "code":"17",               "use":"",       },
    {"mnemonic":"DEC R0",           "code":"18",               "use":"",       },
    {"mnemonic":"DEC R1",           "code":"19",               "use":"",       },
    {"mnemonic":"DEC R2",           "code":"1A",               "use":"",       },
    {"mnemonic":"DEC R3",           "code":"1B",               "use":"",       },
    {"mnemonic":"DEC R4",           "code":"1C",               "use":"",       },
    {"mnemonic":"DEC R5",           "code":"1D",               "use":"",       },
    {"mnemonic":"DEC R6",           "code":"1E",               "use":"",       },
    {"mnemonic":"DEC R7",           "code":"1F",               "use":"",       },
    {"mnemonic":"JB b,r",           "code":"20bbrr",           "use":"b=data_bit, r=code_pcr",   },
    {"mnemonic":"AJMP p",           "code":"21pp",             "use":"code_11",   },
    {"mnemonic":"RET",              "code":"22",               "use":"",       },
    {"mnemonic":"RL A",             "code":"23",               "use":"",       },
    {"mnemonic":"ADD A,#b",          "code":"24bb",             "use":"data_bit",       },
    {"mnemonic":"ADD A,p",          "code":"25pp",             "use":"",       },
    {"mnemonic":"ADD A,@R0",        "code":"26",               "use":"",       },
    {"mnemonic":"ADD A,@R1",        "code":"27",               "use":"",       },
    {"mnemonic":"ADD A,R0",         "code":"28",               "use":"",       },
    {"mnemonic":"ADD A,R1",         "code":"29",               "use":"",       },
    {"mnemonic":"ADD A,R2",         "code":"2A",               "use":"",       },
    {"mnemonic":"ADD A,R3",         "code":"2B",               "use":"",       },
    {"mnemonic":"ADD A,R4",         "code":"2C",               "use":"",       },
    {"mnemonic":"ADD A,R5",         "code":"2D",               "use":"",       },
    {"mnemonic":"ADD A,R6",         "code":"2E",               "use":"",       },
    {"mnemonic":"ADD A,R7",         "code":"2F",               "use":"",       },
    {"mnemonic":"JNB b,r",          "code":"30bbrr",           "use":"code",   },
    {"mnemonic":"ACALL p",          "code":"31pp",             "use":"code_11",       },
    {"mnemonic":"RETI",             "code":"32",               "use":"",       },
    {"mnemonic":"RLC A",            "code":"33",               "use":"",       },
    {"mnemonic":"ADDC A,#b",         "code":"34bb",             "use":"",       },
    {"mnemonic":"ADDC A,p",         "code":"35pp",             "use":"",       },
    {"mnemonic":"ADDC A,@R0",       "code":"36",               "use":"",       },
    {"mnemonic":"ADDC A,@R1",       "code":"37",               "use":"",       },
    {"mnemonic":"ADDC A,R0",        "code":"38",               "use":"",       },
    {"mnemonic":"ADDC A,R1",        "code":"39",               "use":"",       },
    {"mnemonic":"ADDC A,R2",        "code":"3A",               "use":"",       },
    {"mnemonic":"ADDC A,R3",        "code":"3B",               "use":"",       },
    {"mnemonic":"ADDC A,R4",        "code":"3C",               "use":"",       },
    {"mnemonic":"ADDC A,R5",        "code":"3D",               "use":"",       },
    {"mnemonic":"ADDC A,R6",        "code":"3E",               "use":"",       },
    {"mnemonic":"ADDC A,R7",        "code":"3F",               "use":"",       },
    {"mnemonic":"JC r",             "code":"40rr",             "use":"code",   },
    {"mnemonic":"AJMP p",           "code":"41pp",             "use":"code_11",   },
    {"mnemonic":"ORL p,A",          "code":"42pp",             "use":"",       },
    {"mnemonic":"ORL p,b",          "code":"43ppbb",           "use":"",       },
    {"mnemonic":"ORL A,b",          "code":"44bb",             "use":"",       },
    {"mnemonic":"ORL A,p",          "code":"45pp",             "use":"",       },
    {"mnemonic":"ORL A,@R0",        "code":"46",               "use":"",       },
    {"mnemonic":"ORL A,@R1",        "code":"47",               "use":"",       },
    {"mnemonic":"ORL A,R0",         "code":"48",               "use":"",       },
    {"mnemonic":"ORL A,R1",         "code":"49",               "use":"",       },
    {"mnemonic":"ORL A,R2",         "code":"4A",               "use":"",       },
    {"mnemonic":"ORL A,R3",         "code":"4B",               "use":"",       },
    {"mnemonic":"ORL A,R4",         "code":"4C",               "use":"",       },
    {"mnemonic":"ORL A,R5",         "code":"4D",               "use":"",       },
    {"mnemonic":"ORL A,R6",         "code":"4E",               "use":"",       },
    {"mnemonic":"ORL A,R7",         "code":"4F",               "use":"",       },
    {"mnemonic":"JNC r",            "code":"50rr",             "use":"",       },
    {"mnemonic":"ACALL p",          "code":"51pp",             "use":"code_11",       },
    {"mnemonic":"ANL p,A",          "code":"52pp",             "use":"",       },
    {"mnemonic":"ANL p,b",          "code":"53ppbb",           "use":"",       },
    {"mnemonic":"ANL A,b",          "code":"54bb",             "use":"",       },
    {"mnemonic":"ANL A,p",          "code":"55pp",             "use":"",       },
    {"mnemonic":"ANL @R0",          "code":"56",               "use":"",       },
    {"mnemonic":"ANL @R1",          "code":"57",               "use":"",       },
    {"mnemonic":"ANL A,R0",         "code":"58",               "use":"",       },
    {"mnemonic":"ANL A,R1",         "code":"59",               "use":"",       },
    {"mnemonic":"ANL A,R2",         "code":"5A",               "use":"",       },
    {"mnemonic":"ANL A,R3",         "code":"5B",               "use":"",       },
    {"mnemonic":"ANL A,R4",         "code":"5C",               "use":"",       },
    {"mnemonic":"ANL A,R5",         "code":"5D",               "use":"",       },
    {"mnemonic":"ANL A,R6",         "code":"5E",               "use":"",       },
    {"mnemonic":"ANL A,R7",         "code":"5F",               "use":"",       },
    {"mnemonic":"JZ r",             "code":"60rr",             "use":"",       },
    {"mnemonic":"AJMP p",           "code":"61pp",             "use":"code_11",       },
    {"mnemonic":"XRL p,A",          "code":"62pp",             "use":"",       },
    {"mnemonic":"XRL p,b",          "code":"63ppbb",           "use":"",       },
    {"mnemonic":"XRL A,b",          "code":"64bb",             "use":"",       },
    {"mnemonic":"XRL A,p",          "code":"65pp",             "use":"",       },
    {"mnemonic":"XRL A,@R0",        "code":"66",               "use":"",       },
    {"mnemonic":"XRL A,@R1",        "code":"67",               "use":"",       },
    {"mnemonic":"XRL A,R0",         "code":"68",               "use":"",       },
    {"mnemonic":"XRL A,R1",         "code":"69",               "use":"",       },
    {"mnemonic":"XRL A,R2",         "code":"6A",               "use":"",       },
    {"mnemonic":"XRL A,R3",         "code":"6B",               "use":"",       },
    {"mnemonic":"XRL A,R4",         "code":"6C",               "use":"",       },
    {"mnemonic":"XRL A,R5",         "code":"6D",               "use":"",       },
    {"mnemonic":"XRL A,R6",         "code":"6E",               "use":"",       },
    {"mnemonic":"XRL A,R7",         "code":"6F",               "use":"",       },
    {"mnemonic":"JNZ r",            "code":"70rr",             "use":"",       },
    {"mnemonic":"ACALL p",          "code":"71pp",             "use":"code_11",       },
    {"mnemonic":"ORL C,b",          "code":"72bb",             "use":"",       },
    {"mnemonic":"JMP @A+DPTR",      "code":"73",               "use":"",       },
    {"mnemonic":"MOV A,b",          "code":"74bb",             "use":"",       },
    {"mnemonic":"MOV p,#b",         "code":"75ppbb",           "use":"",       },
    {"mnemonic":"MOV @R0,b",        "code":"76bb",             "use":"",       },
    {"mnemonic":"MOV @R1,b",        "code":"77bb",             "use":"",       },
    {"mnemonic":"MOV R0,b",         "code":"78bb",             "use":"",       },
    {"mnemonic":"MOV R1,b",         "code":"79bb",             "use":"",       },
    {"mnemonic":"MOV R2,b",         "code":"7Abb",             "use":"",       },
    {"mnemonic":"MOV R3,b",         "code":"7Bbb",             "use":"",       },
    {"mnemonic":"MOV R4,b",         "code":"7Cbb",             "use":"",       },
    {"mnemonic":"MOV R5,b",         "code":"7Dbb",             "use":"",       },
    {"mnemonic":"MOV R6,b",         "code":"7Ebb",             "use":"",       },
    {"mnemonic":"MOV R7,b",         "code":"7Fbb",             "use":"",       },
    {"mnemonic":"SJMP r",           "code":"80rr",             "use":"",       },
    {"mnemonic":"AJMP p",           "code":"81pp",             "use":"code",   },
    {"mnemonic":"ANL C,b",          "code":"82bb",             "use":"",       },
    {"mnemonic":"MOVC A,@A+PC",     "code":"83",               "use":"",       },
    {"mnemonic":"DIV AB",           "code":"84",               "use":"",       },
    {"mnemonic":"MOV p,q",          "code":"85ppqq",           "use":"",       },
    {"mnemonic":"MOV p,@R0",        "code":"86pp",             "use":"",       },
    {"mnemonic":"MOV p,@R1",        "code":"87pp",             "use":"",       },
    {"mnemonic":"MOV p,R0",         "code":"88pp",             "use":"",       },
    {"mnemonic":"MOV p,R1",         "code":"89pp",             "use":"",       },
    {"mnemonic":"MOV p,R2",         "code":"8App",             "use":"",       },
    {"mnemonic":"MOV p,R3",         "code":"8Bpp",             "use":"",       },
    {"mnemonic":"MOV p,R4",         "code":"8Cpp",             "use":"",       },
    {"mnemonic":"MOV p,R5",         "code":"8Dpp",             "use":"",       },
    {"mnemonic":"MOV p,R6",         "code":"8Epp",             "use":"",       },
    {"mnemonic":"MOV p,R7",         "code":"8Fpp",             "use":"",       },
    {"mnemonic":"MOV DPTR,b",       "code":"90bb",             "use":"",       },
    {"mnemonic":"ACALL p",          "code":"91pp",             "use":"",       },
    {"mnemonic":"MOV b,C",          "code":"92bb",             "use":"",       },
    {"mnemonic":"MOVC A,@A+DPTR",   "code":"93",               "use":"",       },
    {"mnemonic":"SUBB A,b",         "code":"94bb",             "use":"",       },
    {"mnemonic":"SUBB A,p",         "code":"95pp",             "use":"",       },
    {"mnemonic":"SUBB A,@R0",       "code":"96",               "use":"",       },
    {"mnemonic":"SUBB A,@R1",       "code":"97",               "use":"",       },
    {"mnemonic":"SUBB A,R0",        "code":"98",               "use":"",       },
    {"mnemonic":"SUBB A,R1",        "code":"99",               "use":"",       },
    {"mnemonic":"SUBB A,R2",        "code":"9A",               "use":"",       },
    {"mnemonic":"SUBB A,R3",        "code":"9B",               "use":"",       },
    {"mnemonic":"SUBB A,R4",        "code":"9C",               "use":"",       },
    {"mnemonic":"SUBB A,R5",        "code":"9D",               "use":"",       },
    {"mnemonic":"SUBB A,R6",        "code":"9E",               "use":"",       },
    {"mnemonic":"SUBB A,R7",        "code":"9F",               "use":"",       },
    {"mnemonic":"ORL C,/b",         "code":"A0bb",             "use":"",       },
    {"mnemonic":"AJMP p",           "code":"A1pp",             "use":"code_11",       },
    {"mnemonic":"MOV C,b",          "code":"A2bb",             "use":"",       },
    {"mnemonic":"INC DPTR",         "code":"A3",               "use":"",       },
    {"mnemonic":"MUL AB",           "code":"A4",               "use":"",       },
    {"mnemonic":"MOV @R0,p",        "code":"A6",               "use":"",       },
    {"mnemonic":"MOV @R1,p",        "code":"A7",               "use":"",       },
    {"mnemonic":"MOV R0,p",         "code":"A8",               "use":"",       },
    {"mnemonic":"MOV R1,p",         "code":"A9",               "use":"",       },
    {"mnemonic":"MOV R2,p",         "code":"AA",               "use":"",       },
    {"mnemonic":"MOV R3,p",         "code":"AB",               "use":"",       },
    {"mnemonic":"MOV R4,p",         "code":"AC",               "use":"",       },
    {"mnemonic":"MOV R5,p",         "code":"AD",               "use":"",       },
    {"mnemonic":"MOV R6,p",         "code":"AE",               "use":"",       },
    {"mnemonic":"MOV R7,p",         "code":"AF",               "use":"",       },
    {"mnemonic":"ANL C,/b",         "code":"B0bb",             "use":"",       },
    {"mnemonic":"ACALL p",          "code":"B1pp",             "use":"",       },
    {"mnemonic":"CPL b",            "code":"B2bb",             "use":"",       },
    {"mnemonic":"CPL C",            "code":"B3",               "use":"",       },
    {"mnemonic":"CJNE A,b,r",       "code":"B4bbrr",           "use":"",       },
    {"mnemonic":"CJNE A,p,r",       "code":"B5pprr",           "use":"",       },
    {"mnemonic":"CJNE @R0,b,r",     "code":"B6bbrr",           "use":"",       },
    {"mnemonic":"CJNE @R1,b,r",     "code":"B7bbrr",           "use":"",       },
    {"mnemonic":"CJNE R0,b,r",      "code":"B8bbrr",           "use":"",       },
    {"mnemonic":"CJNE R1,b,r",      "code":"B9bbrr",           "use":"",       },
    {"mnemonic":"CJNE R2,b,r",      "code":"BAbbrr",           "use":"",       },
    {"mnemonic":"CJNE R3,b,r",      "code":"BBbbrr",           "use":"",       },
    {"mnemonic":"CJNE R4,b,r",      "code":"BCbbrr",           "use":"",       },
    {"mnemonic":"CJNE R5,b,r",      "code":"BDbbrr",           "use":"",       },
    {"mnemonic":"CJNE R6,b,r",      "code":"BEbbrr",           "use":"",       },
    {"mnemonic":"CJNE R7,b,r",      "code":"BFbbrr",           "use":"",       },
    {"mnemonic":"PUSH p",           "code":"C0pp",             "use":"",       },
    {"mnemonic":"AJMP p",           "code":"C1pp",             "use":"code_11",       },
    {"mnemonic":"CLR b",            "code":"C2bb",             "use":"",       },
    {"mnemonic":"CLR C",            "code":"C3",               "use":"",       },
    {"mnemonic":"SWAP A",           "code":"C4",               "use":"",       },
    {"mnemonic":"XCH A,p",          "code":"C5pp",             "use":"",       },
    {"mnemonic":"XCH A,@R0",        "code":"C6",               "use":"",       },
    {"mnemonic":"XCH A,@R1",        "code":"C7",               "use":"",       },
    {"mnemonic":"XCH A,R0",         "code":"C8",               "use":"",       },
    {"mnemonic":"XCH A,R1",         "code":"C9",               "use":"",       },
    {"mnemonic":"XCH A,R2",         "code":"CA",               "use":"",       },
    {"mnemonic":"XCH A,R3",         "code":"CB",               "use":"",       },
    {"mnemonic":"XCH A,R4",         "code":"CC",               "use":"",       },
    {"mnemonic":"XCH A,R5",         "code":"CD",               "use":"",       },
    {"mnemonic":"XCH A,R6",         "code":"CE",               "use":"",       },
    {"mnemonic":"XCH A,R7",         "code":"CF",               "use":"",       },
    {"mnemonic":"POP p",            "code":"D0pp",             "use":"",       },
    {"mnemonic":"ACALL p",          "code":"D1pp",             "use":"",       },
    {"mnemonic":"SETB b",           "code":"D2bb",             "use":"",       },
    {"mnemonic":"SETB C",           "code":"D3",               "use":"",       },
    {"mnemonic":"DA A",             "code":"D4",               "use":"",       },
    {"mnemonic":"DJNZ p,r",         "code":"D5pprr",           "use":"",       },
    {"mnemonic":"XCHD A,@R0",       "code":"D6",               "use":"",       },
    {"mnemonic":"XCHD A,@R1",       "code":"D7",               "use":"",       },
    {"mnemonic":"DJNZ R0,r",        "code":"D8rr",             "use":"",       },
    {"mnemonic":"DJNZ R1,r",        "code":"D9rr",             "use":"",       },
    {"mnemonic":"DJNZ R2,r",        "code":"DArr",             "use":"",       },
    {"mnemonic":"DJNZ R3,r",        "code":"DBrr",             "use":"",       },
    {"mnemonic":"DJNZ R4,r",        "code":"DCrr",             "use":"",       },
    {"mnemonic":"DJNZ R5,r",        "code":"DDrr",             "use":"",       },
    {"mnemonic":"DJNZ R6,r",        "code":"DErr",             "use":"",       },
    {"mnemonic":"DJNZ R7,r",        "code":"DFrr",             "use":"",       },
    {"mnemonic":"MOVX A,@DPTR",     "code":"E0",               "use":"",       },
    {"mnemonic":"AJMP p",           "code":"E1pp",             "use":"code_11",       },
    {"mnemonic":"MOVX A,@R0",       "code":"E2",               "use":"",       },
    {"mnemonic":"MOVX A,@R1",       "code":"E3",               "use":"",       },
    {"mnemonic":"CLR A",            "code":"E4",               "use":"",       },
    {"mnemonic":"MOV A,p",          "code":"E5pp",             "use":"",       },
    {"mnemonic":"MOV A,@R0",        "code":"E6",               "use":"",       },
    {"mnemonic":"MOV A,@R1",        "code":"E7",               "use":"",       },
    {"mnemonic":"MOV A,R0",         "code":"E8",               "use":"",       },
    {"mnemonic":"MOV A,R1",         "code":"E9",               "use":"",       },
    {"mnemonic":"MOV A,R2",         "code":"EA",               "use":"",       },
    {"mnemonic":"MOV A,R3",         "code":"EB",               "use":"",       },
    {"mnemonic":"MOV A,R4",         "code":"EC",               "use":"",       },
    {"mnemonic":"MOV A,R5",         "code":"ED",               "use":"",       },
    {"mnemonic":"MOV A,R6",         "code":"EE",               "use":"",       },
    {"mnemonic":"MOV A,R7",         "code":"EF",               "use":"",       },
    {"mnemonic":"MOVX @DPTR,A",     "code":"F0",               "use":"",       },
    {"mnemonic":"ACALL p",          "code":"F1pp",             "use":"",       },
    {"mnemonic":"MOVX @R0,A",       "code":"F2",               "use":"",       },
    {"mnemonic":"MOVX @R1,A",       "code":"F3",               "use":"",       },
    {"mnemonic":"CPL A",            "code":"F4",               "use":"",       },
    {"mnemonic":"MOV p,A",          "code":"F5pp",             "use":"",       },
    {"mnemonic":"MOV @R0,A",        "code":"F6",               "use":"",       },
    {"mnemonic":"MOV @R1,A",        "code":"F7",               "use":"",       },
    {"mnemonic":"MOV R0,A",         "code":"F8",               "use":"",       },
    {"mnemonic":"MOV R1,A",         "code":"F9",               "use":"",       },
    {"mnemonic":"MOV R2,A",         "code":"FA",               "use":"",       },
    {"mnemonic":"MOV R3,A",         "code":"FB",               "use":"",       },
    {"mnemonic":"MOV R4,A",         "code":"FC",               "use":"",       },
    {"mnemonic":"MOV R5,A",         "code":"FD",               "use":"",       },
    {"mnemonic":"MOV R6,A",         "code":"FE",               "use":"",       },
    {"mnemonic":"MOV R7,A",         "code":"FF",               "use":"",       },
]


class CPU_8052(cpu.base_cpu.CPU):

    def __init__(self):
        super().__init__(OPCODES)

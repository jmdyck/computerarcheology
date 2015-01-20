
F000: 76 28 43   ROR  $2843          ; 
F003: 29 31      BVS  $F036          ; 
F005: 39         RTS                 ; 
F006: 38         PULX                ; 
F007: 32         PULA                ; 
F008: 20 57      BRA  $F061          ; 
F00A: 49         ROLA                ; 
F00B: 4C         INCA                ; 
F00C: 4C         INCA                ; 
F00D: 49         ROLA                ; 
F00E: 41 
F00F: 4D         TSTA                ; 
F010: 53         COMB                ; 
F011: 20 45      BRA  $F058          ; 
F013: 4C         INCA                ; 
F014: 45  
F015: 43         COMA                ; 
F016: 54         LSRB                ; 
F017: 52 
F018: 4F         CLRA                ; 
F019: 4E 
F01A: 49         ROLA                ; 
F01B: 43         COMA                ; 
F01C: 53         COMB                ; 

; RESET Handler
;
F01D: 0F         SEI                 ; Ignore interrupts while we are setting up
F01E: 8E 00 7F   LDS  #$007F         ; Stack builds down from top of onboard RAM
F021: CE 04 00   LDX  #$0400         ; 
F024: 6F 01      CLR  $01,X          ; 
F026: 6F 03      CLR  $03,X          ; 
F028: 86 FF      LDA  #$FF           ; 
F02A: A7 00      STA  $00,X          ; ?? Looks like a 6821 PIA port
F02C: 6F 02      CLR  $02,X          ; 
F02E: 86 37      LDA  #$37           ; 
F030: A7 03      STA  $03,X          ; 
F032: 86 3C      LDA  #$3C           ; 
F034: A7 01      STA  $01,X          ; 
F036: 97 05      STA  >$05           ; 
F038: 4F         CLRA                ; 
F039: 97 03      STA  >$03           ; 
F03B: 97 00      STA  >$00           ; 
F03D: 97 01      STA  >$01           ; 
F03F: 97 02      STA  >$02           ; 
F041: 97 04      STA  >$04           ; 
F043: 0E         CLI                 ; Enable interrupts
F044: 20 FE      BRA  $F044          ; The processor is interrupt driven. Infinite loop. 

F046: DF 0C      STX  >$0C           ; 
F048: CE F0 EB   LDX  #$F0EB         ; 
F04B: DF 07      STX  >$07           ; 
F04D: 86 80      LDA  #$80           ; 
F04F: D6 15      LDB  >$15           ; 
F051: 2A 09      BPL  $F05C          ; 
F053: D6 06      LDB  >$06           ; 
F055: 54         LSRB                ; 
F056: 54         LSRB                ; 
F057: 54         LSRB                ; 
F058: 5C         INCB                ; 
F059: 5A         DECB                ; 
F05A: 26 FD      BNE  $F059          ; 
F05C: 7A 00 1A   DEC  $001A          ; 
F05F: 27 4C      BEQ  $F0AD          ; 
F061: 7A 00 1B   DEC  $001B          ; 
F064: 27 4C      BEQ  $F0B2          ; 
F066: 7A 00 1C   DEC  $001C          ; 
F069: 27 4C      BEQ  $F0B7          ; 
F06B: 7A 00 1D   DEC  $001D          ; 
F06E: 26 DF      BNE  $F04F          ; 
F070: D6 15      LDB  >$15           ; 
F072: 27 DB      BEQ  $F04F          ; 
F074: C4 7F      ANDB #$7F           ; 
F076: D7 1D      STB  >$1D           ; 
F078: D6 06      LDB  >$06           ; 
F07A: 58         ASLB                ; 
F07B: DB 06      ADDB >$06           ; 
F07D: CB 0B      ADDB #$0B           ; 
F07F: D7 06      STB  >$06           ; 
F081: 7A 00 2D   DEC  $002D          ; 
F084: 26 0E      BNE  $F094          ; 
F086: D6 21      LDB  >$21           ; 
F088: D7 2D      STB  >$2D           ; 
F08A: DE 07      LDX  >$07           ; 
F08C: 09         DEX                 ; 
F08D: 8C F0 E4   CPX  #$F0E4         ; 
F090: 27 4E      BEQ  $F0E0          ; 
F092: DF 07      STX  >$07           ; 
F094: D6 06      LDB  >$06           ; 
F096: 2B 06      BMI  $F09E          ; 
F098: D4 19      ANDB >$19           ; 
F09A: C4 7F      ANDB #$7F           ; 
F09C: 20 05      BRA  $F0A3          ; 
F09E: D4 19      ANDB >$19           ; 
F0A0: C4 7F      ANDB #$7F           ; 
F0A2: 50         NEGB                ; 
F0A3: 36         PSHA                ; 
F0A4: 1B         ABA                 ; 
F0A5: 16         TAB                 ; 
F0A6: 32         PULA                ; 
F0A7: DE 07      LDX  >$07           ; 
F0A9: AD 00      JSR  $00,X          ; 
F0AB: 20 A2      BRA  $F04F          ; 
F0AD: CE 00 12   LDX  #$0012         ; 
F0B0: 20 08      BRA  $F0BA          ; 
F0B2: CE 00 13   LDX  #$0013         ; 
F0B5: 20 03      BRA  $F0BA          ; 
F0B7: CE 00 14   LDX  #$0014         ; 
F0BA: 6D 18      TST  $18,X          ; 
F0BC: 27 12      BEQ  $F0D0          ; 
F0BE: 6A 18      DEC  $18,X          ; 
F0C0: 26 0E      BNE  $F0D0          ; 
F0C2: E6 0C      LDB  $0C,X          ; 
F0C4: E7 18      STB  $18,X          ; 
F0C6: E6 00      LDB  $00,X          ; 
F0C8: EB 10      ADDB $10,X          ; 
F0CA: E1 14      CMPB $14,X          ; 
F0CC: 27 12      BEQ  $F0E0          ; 
F0CE: E7 00      STB  $00,X          ; 
F0D0: E6 00      LDB  $00,X          ; 
F0D2: E7 08      STB  $08,X          ; 
F0D4: AB 04      ADDA $04,X          ; 
F0D6: 60 04      NEG  $04,X          ; 
F0D8: 16         TAB                 ; 
F0D9: DE 07      LDX  >$07           ; 
F0DB: AD 00      JSR  $00,X          ; 
F0DD: 7E F0 4F   JMP  $F04F          ; 
F0E0: DE 0C      LDX  >$0C           ; 
F0E2: 39         RTS                 ; 
F0E3: 54         LSRB                ; 
F0E4: 54         LSRB                ; 
F0E5: 54         LSRB                ; 
F0E6: 54         LSRB                ; 
F0E7: 54         LSRB                ; 
F0E8: 54         LSRB                ; 
F0E9: 54         LSRB                ; 
F0EA: 54         LSRB                ; 
F0EB: F7 04 00   STB  $0400          ; 
F0EE: 39         RTS                 ; 
F0EF: CE F3 D2   LDX  #$F3D2         ; 
F0F2: C6 1C      LDB  #$1C           ; 
F0F4: BD F9 65   JSR  $F965          ; 
F0F7: BD F0 46   JSR  $F046          ; 
F0FA: 39         RTS                 ; 
F0FB: CE F3 EE   LDX  #$F3EE         ; 
F0FE: 20 F2      BRA  $F0F2          ; 
F100: CE F4 0A   LDX  #$F40A         ; 
F103: 20 ED      BRA  $F0F2          ; 
F105: CE F4 26   LDX  #$F426         ; 
F108: 20 E8      BRA  $F0F2          ; 
F10A: CE F4 42   LDX  #$F442         ; 
F10D: 20 E3      BRA  $F0F2          ; 
F10F: CE F4 7A   LDX  #$F47A         ; 
F112: 20 DE      BRA  $F0F2          ; 
F114: CE F4 96   LDX  #$F496         ; 
F117: 20 D9      BRA  $F0F2          ; 
F119: CE 00 60   LDX  #$0060         ; 
F11C: A6 00      LDA  $00,X          ; 
F11E: 80 02      SUBA #$02           ; 
F120: A7 00      STA  $00,X          ; 
F122: BD F3 30   JSR  $F330          ; 
F125: 7E F3 49   JMP  $F349          ; 
F128: CE 00 01   LDX  #$0001         ; 
F12B: DF 12      STX  >$12           ; 
F12D: CE 03 80   LDX  #$0380         ; 
F130: DF 14      STX  >$14           ; 
F132: 7F 04 00   CLR  $0400          ; 
F135: DE 12      LDX  >$12           ; 
F137: 08         INX                 ; 
F138: DF 12      STX  >$12           ; 
F13A: 09         DEX                 ; 
F13B: 26 FD      BNE  $F13A          ; 
F13D: 73 04 00   COM  $0400          ; 
F140: DE 14      LDX  >$14           ; 
F142: 09         DEX                 ; 
F143: 26 FD      BNE  $F142          ; 
F145: 20 EB      BRA  $F132          ; 
F147: 86 FF      LDA  #$FF           ; 
F149: 97 12      STA  >$12           ; 
F14B: CE FE C0   LDX  #$FEC0         ; 
F14E: DF 14      STX  >$14           ; 
F150: 86 20      LDA  #$20           ; 
F152: CE FF E0   LDX  #$FFE0         ; 
F155: 8D 05      BSR  $F15C          ; 
F157: 86 01      LDA  #$01           ; 
F159: CE 00 44   LDX  #$0044         ; 
F15C: 97 16      STA  >$16           ; 
F15E: DF 17      STX  >$17           ; 
F160: CE 00 10   LDX  #$0010         ; 
F163: 8D 21      BSR  $F186          ; 
F165: 96 13      LDA  >$13           ; 
F167: 9B 15      ADDA >$15           ; 
F169: 97 13      STA  >$13           ; 
F16B: 96 12      LDA  >$12           ; 
F16D: 99 14      ADCA >$14           ; 
F16F: 97 12      STA  >$12           ; 
F171: 09         DEX                 ; 
F172: 26 EF      BNE  $F163          ; 
F174: 96 15      LDA  >$15           ; 
F176: 9B 16      ADDA >$16           ; 
F178: 97 15      STA  >$15           ; 
F17A: 24 03      BCC  $F17F          ; 
F17C: 7C 00 14   INC  $0014          ; 
F17F: DE 14      LDX  >$14           ; 
F181: 9C 17      CPX  >$17           ; 
F183: 26 DB      BNE  $F160          ; 
F185: 39         RTS                 ; 
F186: 4F         CLRA                ; 
F187: B7 04 00   STA  $0400          ; 
F18A: 8B 20      ADDA #$20           ; 
F18C: 24 F9      BCC  $F187          ; 
F18E: 8D 09      BSR  $F199          ; 
F190: 86 E0      LDA  #$E0           ; 
F192: B7 04 00   STA  $0400          ; 
F195: 80 20      SUBA #$20           ; 
F197: 24 F9      BCC  $F192          ; 
F199: D6 12      LDB  >$12           ; 
F19B: 86 02      LDA  #$02           ; 
F19D: 4A         DECA                ; 
F19E: 26 FD      BNE  $F19D          ; 
F1A0: 5A         DECB                ; 
F1A1: 26 F8      BNE  $F19B          ; 
F1A3: 39         RTS                 ; 
F1A4: 86 80      LDA  #$80           ; 
F1A6: 97 1C      STA  >$1C           ; 
F1A8: 86 F1      LDA  #$F1           ; 
F1AA: 97 1A      STA  >$1A           ; 
F1AC: 86 80      LDA  #$80           ; 
F1AE: 97 10      STA  >$10           ; 
F1B0: 86 12      LDA  #$12           ; 
F1B2: 4A         DECA                ; 
F1B3: 26 FD      BNE  $F1B2          ; 
F1B5: 96 19      LDA  >$19           ; 
F1B7: 9B 1C      ADDA >$1C           ; 
F1B9: 97 19      STA  >$19           ; 
F1BB: 44         LSRA                ; 
F1BC: 44         LSRA                ; 
F1BD: 44         LSRA                ; 
F1BE: 8B D8      ADDA #$D8           ; 
F1C0: 97 1B      STA  >$1B           ; 
F1C2: DE 1A      LDX  >$1A           ; 
F1C4: A6 00      LDA  $00,X          ; 
F1C6: B7 04 00   STA  $0400          ; 
F1C9: 7A 00 10   DEC  $0010          ; 
F1CC: 26 E2      BNE  $F1B0          ; 
F1CE: 7A 00 1C   DEC  $001C          ; 
F1D1: 96 1C      LDA  >$1C           ; 
F1D3: 81 20      CMPA #$20           ; 
F1D5: 26 D5      BNE  $F1AC          ; 
F1D7: 39         RTS                 ; 
F1D8: 80 8C      SUBA #$8C           ; 
F1DA: 98 A5      EORA >$A5           ; 
F1DC: B0 BC C6   SUBA $BCC6          ; 
F1DF: D0 DA      SUBB >$DA           ; 
F1E1: E2 EA      SBCB $EA,X          ; 
F1E3: F0 F5 FA   SUBB $F5FA          ; 
STD  m
{BASE_ADDRESS_BYTE_DATA=FE}
ADDRESS_WORD_TEXT
[253, 254]
F1E6: FD FE      STD  $0000          ; 
F1E8: FF FE FD   STX  $FEFD          ; 
F1EB: FA F5 F0   ORB  $F5F0          ; 
F1EE: EA E2      ORB  $E2,X          ; 
F1F0: DA D0      ORB  >$D0           ; 
F1F2: C6 BC      LDB  #$BC           ; 
F1F4: B0 A5 98   SUBA $A598          ; 
F1F7: 8C 80 73   CPX  #$8073         ; 
F1FA: 67 5A      ASR  $5A,X          ; 
F1FC: 4F         CLRA                ; 
F1FD: 43         COMA                ; 
F1FE: 39         RTS                 ; 
F1FF: 2F 25      BLE  $F226          ; 
F201: 1D 
F202: 15 
F203: 0F         SEI                 ; 
F204: 0A         CLV                 ; 
F205: 05 
F206: 02 
F207: 01         NOP                 ; 
F208: 00 
F209: 01         NOP                 ; 
F20A: 02 
F20B: 05 
F20C: 0A         CLV                 ; 
F20D: 0F         SEI                 ; 
F20E: 15 
F20F: 1D 
F210: 25 2F      BCS  $F241          ; 
F212: 39         RTS                 ; 
F213: 43         COMA                ; 
F214: 4F         CLRA                ; 
F215: 5A         DECB                ; 
F216: 67 73      ASR  $73,X          ; 
F218: 7F 04 02   CLR  $0402          ; 
F21B: CE F2 5F   LDX  #$F25F         ; 
F21E: DF 14      STX  >$14           ; 
F220: DE 14      LDX  >$14           ; 
F222: A6 00      LDA  $00,X          ; 
F224: 27 33      BEQ  $F259          ; 
F226: E6 01      LDB  $01,X          ; 
F228: C4 F0      ANDB #$F0           ; 
F22A: D7 13      STB  >$13           ; 
F22C: E6 01      LDB  $01,X          ; 
F22E: 08         INX                 ; 
F22F: 08         INX                 ; 
F230: DF 14      STX  >$14           ; 
F232: 97 12      STA  >$12           ; 
F234: C4 0F      ANDB #$0F           ; 
F236: 96 13      LDA  >$13           ; 
F238: B7 04 00   STA  $0400          ; 
F23B: 96 12      LDA  >$12           ; 
F23D: CE 00 05   LDX  #$0005         ; 
F240: 09         DEX                 ; 
F241: 26 FD      BNE  $F240          ; 
F243: 4A         DECA                ; 
F244: 26 F7      BNE  $F23D          ; 
F246: 7F 04 00   CLR  $0400          ; 
F249: 96 12      LDA  >$12           ; 
F24B: CE 00 05   LDX  #$0005         ; 
F24E: 09         DEX                 ; 
F24F: 26 FD      BNE  $F24E          ; 
F251: 4A         DECA                ; 
F252: 26 F7      BNE  $F24B          ; 
F254: 5A         DECB                ; 
F255: 26 DF      BNE  $F236          ; 
F257: 20 C7      BRA  $F220          ; 
F259: 86 80      LDA  #$80           ; 
F25B: B7 04 02   STA  $0402          ; 
F25E: 39         RTS                 ; 
F25F: 01         NOP                 ; 
F260: FC 02 FC   LDD  $02FC          ; 
F263: 03 
F264: F8 04 F8   EORB $04F8          ; 
F267: 06         TAP                 ; 
F268: F8 08 F4   EORB $08F4          ; 
F26B: 0C         CLC                 ; 
F26C: F4 10 F4   ANDB $10F4          ; 
F26F: 20 F2      BRA  $F263          ; 
F271: 40         NEGA                ; 
F272: F1 60 F1   CMPB $60F1          ; 
F275: 80 F1      SUBA #$F1           ; 
F277: A0 F1      SUBA $F1,X          ; 
F279: C0 F1      SUBB #$F1           ; 
F27B: 00 
F27C: 00 
F27D: 7A 00 2E   DEC  $002E          ; 
F280: 20 04      BRA  $F286          ; 
F282: C6 A0      LDB  #$A0           ; 
F284: D7 2E      STB  >$2E           ; 
F286: 86 04      LDA  #$04           ; 
F288: 97 13      STA  >$13           ; 
F28A: 86 9F      LDA  #$9F           ; 
F28C: D6 2E      LDB  >$2E           ; 
F28E: CE 01 C0   LDX  #$01C0         ; 
F291: 09         DEX                 ; 
F292: 27 20      BEQ  $F2B4          ; 
F294: F7 00 12   STB  $0012          ; 
F297: B7 04 00   STA  $0400          ; 
F29A: 09         DEX                 ; 
F29B: 27 17      BEQ  $F2B4          ; 
F29D: 7A 00 12   DEC  $0012          ; 
F2A0: 26 F8      BNE  $F29A          ; 
F2A2: 09         DEX                 ; 
F2A3: 27 0F      BEQ  $F2B4          ; 
F2A5: D7 12      STB  >$12           ; 
F2A7: 73 04 00   COM  $0400          ; 
F2AA: 09         DEX                 ; 
F2AB: 27 07      BEQ  $F2B4          ; 
F2AD: 7A 00 12   DEC  $0012          ; 
F2B0: 26 F8      BNE  $F2AA          ; 
F2B2: 20 DD      BRA  $F291          ; 
F2B4: D0 13      SUBB >$13           ; 
F2B6: C1 10      CMPB #$10           ; 
F2B8: 22 D4      BHI  $F28E          ; 
F2BA: 39         RTS                 ; 
F2BB: C6 11      LDB  #$11           ; 
F2BD: D7 2E      STB  >$2E           ; 
F2BF: 86 FE      LDA  #$FE           ; 
F2C1: 97 13      STA  >$13           ; 
F2C3: 20 C5      BRA  $F28A          ; 
F2C5: CE F4 B2   LDX  #$F4B2         ; 
F2C8: 20 26      BRA  $F2F0          ; 
F2CA: BD F3 30   JSR  $F330          ; 
F2CD: BD F3 49   JSR  $F349          ; 
F2D0: 39         RTS                 ; 
F2D1: CE F4 B8   LDX  #$F4B8         ; 
F2D4: 20 F4      BRA  $F2CA          ; 
F2D6: C6 FF      LDB  #$FF           ; 
F2D8: D7 09      STB  >$09           ; 
F2DA: CE F4 BE   LDX  #$F4BE         ; 
F2DD: 8D EB      BSR  $F2CA          ; 
F2DF: CE F4 C4   LDX  #$F4C4         ; 
F2E2: 8D E6      BSR  $F2CA          ; 
F2E4: 5A         DECB                ; 
F2E5: 26 F3      BNE  $F2DA          ; 
F2E7: 39         RTS                 ; 
F2E8: CE F4 CA   LDX  #$F4CA         ; 
F2EB: 20 DD      BRA  $F2CA          ; 
F2ED: CE F4 D6   LDX  #$F4D6         ; 
F2F0: 8D D8      BSR  $F2CA          ; 
F2F2: 8D 30      BSR  $F324          ; 
F2F4: 20 FA      BRA  $F2F0          ; 
F2F6: 86 FF      LDA  #$FF           ; 
F2F8: 97 09      STA  >$09           ; 
F2FA: CE F4 DC   LDX  #$F4DC         ; 
F2FD: 20 F1      BRA  $F2F0          ; 
F2FF: 86 FF      LDA  #$FF           ; 
F301: 97 09      STA  >$09           ; 
F303: CE F4 D0   LDX  #$F4D0         ; 
F306: 20 E8      BRA  $F2F0          ; 
F308: C6 30      LDB  #$30           ; 
F30A: CE F4 E2   LDX  #$F4E2         ; 
F30D: 8D 21      BSR  $F330          ; 
F30F: 96 06      LDA  >$06           ; 
F311: 48         ASLA                ; 
F312: 9B 06      ADDA >$06           ; 
F314: 8B 0B      ADDA #$0B           ; 
F316: 97 06      STA  >$06           ; 
F318: 44         LSRA                ; 
F319: 44         LSRA                ; 
F31A: 8B 0C      ADDA #$0C           ; 
F31C: 97 13      STA  >$13           ; 
F31E: 8D 29      BSR  $F349          ; 
F320: 5A         DECB                ; 
F321: 26 EC      BNE  $F30F          ; 
F323: 39         RTS                 ; 
F324: 96 09      LDA  >$09           ; 
F326: 80 08      SUBA #$08           ; 
F328: 2A 03      BPL  $F32D          ; 
F32A: 97 09      STA  >$09           ; 
F32C: 39         RTS                 ; 
F32D: 32         PULA                ; 
F32E: 32         PULA                ; 
F32F: 39         RTS                 ; 
F330: A6 00      LDA  $00,X          ; 
F332: 97 13      STA  >$13           ; 
F334: A6 01      LDA  $01,X          ; 
F336: 97 14      STA  >$14           ; 
F338: A6 02      LDA  $02,X          ; 
F33A: 97 15      STA  >$15           ; 
F33C: A6 03      LDA  $03,X          ; 
F33E: 97 16      STA  >$16           ; 
F340: A6 04      LDA  $04,X          ; 
F342: 97 17      STA  >$17           ; 
F344: A6 05      LDA  $05,X          ; 
F346: 97 18      STA  >$18           ; 
F348: 39         RTS                 ; 
F349: 96 09      LDA  >$09           ; 
F34B: 37         PSHB                ; 
F34C: D6 17      LDB  >$17           ; 
F34E: D7 19      STB  >$19           ; 
F350: D6 14      LDB  >$14           ; 
F352: D7 1A      STB  >$1A           ; 
F354: 43         COMA                ; 
F355: D6 13      LDB  >$13           ; 
F357: B7 04 00   STA  $0400          ; 
F35A: 5A         DECB                ; 
F35B: 26 FD      BNE  $F35A          ; 
F35D: 43         COMA                ; 
F35E: D6 13      LDB  >$13           ; 
F360: 20 00      BRA  $F362          ; 
F362: 08         INX                 ; 
F363: 09         DEX                 ; 
F364: 08         INX                 ; 
F365: 09         DEX                 ; 
F366: B7 04 00   STA  $0400          ; 
F369: 5A         DECB                ; 
F36A: 26 FD      BNE  $F369          ; 
F36C: 7A 00 1A   DEC  $001A          ; 
F36F: 27 16      BEQ  $F387          ; 
F371: 7A 00 19   DEC  $0019          ; 
F374: 26 DE      BNE  $F354          ; 
F376: 43         COMA                ; 
F377: D6 17      LDB  >$17           ; 
F379: B7 04 00   STA  $0400          ; 
F37C: D7 19      STB  >$19           ; 
F37E: D6 13      LDB  >$13           ; 
F380: 9B 18      ADDA >$18           ; 
F382: 2B 1E      BMI  $F3A2          ; 
F384: 01         NOP                 ; 
F385: 20 15      BRA  $F39C          ; 
F387: 08         INX                 ; 
F388: 09         DEX                 ; 
F389: 01         NOP                 ; 
F38A: 43         COMA                ; 
F38B: D6 14      LDB  >$14           ; 
F38D: B7 04 00   STA  $0400          ; 
F390: D7 1A      STB  >$1A           ; 
F392: D6 13      LDB  >$13           ; 
F394: D0 15      SUBB >$15           ; 
F396: D1 16      CMPB >$16           ; 
F398: D1 16      CMPB >$16           ; 
F39A: 27 06      BEQ  $F3A2          ; 
F39C: D7 13      STB  >$13           ; 
F39E: C0 05      SUBB #$05           ; 
F3A0: 20 B8      BRA  $F35A          ; 
F3A2: 33         PULB                ; 
F3A3: 39         RTS                 ; 
F3A4: DA FF      ORB  >$FF           ; 
F3A6: DA 80      ORB  >$80           ; 
F3A8: 26 01      BNE  $F3AB          ; 
F3AA: 26 80      BNE  $F32C          ; 
F3AC: 07         TPA                 ; 
F3AD: 0A         CLV                 ; 
F3AE: 07         TPA                 ; 
F3AF: 00 
F3B0: F9 F6 F9   ADCB $F6F9          ; 
F3B3: 00 
F3B4: 3A         ABX                 ; 
F3B5: 3E         WAI                 ; 
F3B6: 50         NEGB                ; 
F3B7: 46         RORA                ; 
F3B8: 33         PULB                ; 
F3B9: 2C 27      BGE  $F3E2          ; 
F3BB: 20 25      BRA  $F3E2          ; 
F3BD: 1C 
F3BE: 1A 
F3BF: 17         TBA                 ; 
F3C0: 14 
F3C1: 11         CBA                 ; 
F3C2: 10         SBA                 ; 
F3C3: 33         PULB                ; 
F3C4: 08         INX                 ; 
F3C5: 03 
F3C6: 02 
F3C7: 01         NOP                 ; 
F3C8: 02 
F3C9: 03 
F3CA: 04         LSRD                ; 
F3CB: 05 
F3CC: 06         TAP                 ; 
F3CD: 0A         CLV                 ; 
F3CE: 1E 
F3CF: 32         PULA                ; 
F3D0: 70 00 FF   NEG  $00FF          ; 
F3D3: FF FF 90   STX  $FF90          ; 
F3D6: FF FF FF   STX  $FFFF          ; 
F3D9: FF FF FF   STX  $FFFF          ; 
F3DC: FF 90 FF   STX  $90FF          ; 
F3DF: FF FF FF   STX  $FFFF          ; 
F3E2: FF FF FF   STX  $FFFF          ; 
F3E5: FF 00 00   STX  $0000          ; 
F3E8: 00 
F3E9: 00 
F3EA: 00 
F3EB: 00 
F3EC: 00 
F3ED: 00 
F3EE: 48         ASLA                ; 
F3EF: 01         NOP                 ; 
F3F0: 00 
F3F1: 00 
F3F2: 3F         SWI                 ; 
F3F3: 3F         SWI                 ; 
F3F4: 00 
F3F5: 00 
F3F6: 48         ASLA                ; 
F3F7: 01         NOP                 ; 
F3F8: 00 
F3F9: 00 
F3FA: 01         NOP                 ; 
F3FB: 08         INX                 ; 
F3FC: 00 
F3FD: 00 
F3FE: 81 01      CMPA #$01           ; 
F400: 00 
F401: 00 
F402: 01         NOP                 ; 
F403: FF 00 00   STX  $0000          ; 
F406: 01         NOP                 ; 
F407: 08         INX                 ; 
F408: 00 
F409: 00 
F40A: 01         NOP                 ; 
F40B: 10         SBA                 ; 
F40C: 00 
F40D: 00 
F40E: 3F         SWI                 ; 
F40F: 3F         SWI                 ; 
F410: 00 
F411: 00 
F412: 01         NOP                 ; 
F413: 10         SBA                 ; 
F414: 00 
F415: 00 
F416: 05 
F417: 05 
F418: 00 
F419: 00 
F41A: 01         NOP                 ; 
F41B: 01         NOP                 ; 
F41C: 00 
F41D: 00 
F41E: 31         INS                 ; 
F41F: FF 00 00   STX  $0000          ; 
F422: 05 
F423: 05 
F424: 00 
F425: 00 
F426: 30         TSX                 ; 
F427: 00 
F428: 00 
F429: 00 
F42A: 7F 00 00   CLR  $0000          ; 
F42D: 00 
F42E: 30         TSX                 ; 
F42F: 00 
F430: 00 
F431: 00 
F432: 01         NOP                 ; 
F433: 00 
F434: 00 
F435: 00 
F436: 7F 00 00   CLR  $0000          ; 
F439: 00 
F43A: 02 
F43B: 00 
F43C: 00 
F43D: 00 
F43E: 01         NOP                 ; 
F43F: 00 
F440: 00 
F441: 00 
F442: 04         LSRD                ; 
F443: 00 
F444: 00 
F445: 04         LSRD                ; 
F446: 7F 00 00   CLR  $0000          ; 
F449: 7F 04 00   CLR  $0400          ; 
F44C: 00 
F44D: 04         LSRD                ; 
F44E: FF 00 00   STX  $0000          ; 
F451: A0 00      SUBA $00,X          ; 
F453: 00 
F454: 00 
F455: 00 
F456: 00 
F457: 00 
F458: 00 
F459: 00 
F45A: FF 00 00   STX  $0000          ; 
F45D: A0 0C      SUBA $0C,X          ; 
F45F: 68 68      ASL  $68,X          ; 
F461: 00 
F462: 07         TPA                 ; 
F463: 1F 
F464: 0F         SEI                 ; 
F465: 00 
F466: 0C         CLC                 ; 
F467: 80 80      SUBA #$80           ; 
F469: 00 
F46A: FF FF FF   STX  $FFFF          ; 
F46D: 00 
F46E: 00 
F46F: 00 
F470: 00 
F471: 00 
F472: 00 
F473: 00 
F474: 00 
F475: 00 
F476: FF FF FF   STX  $FFFF          ; 
F479: 00 
F47A: 01         NOP                 ; 
F47B: 04         LSRD                ; 
F47C: 00 
F47D: 00 
F47E: 3F         SWI                 ; 
F47F: 7F 00 00   CLR  $0000          ; 
F482: 01         NOP                 ; 
F483: 04         LSRD                ; 
F484: 00 
F485: 00 
F486: 05 
F487: FF 00 00   STX  $0000          ; 
F48A: 01         NOP                 ; 
F48B: 00 
F48C: 00 
F48D: 00 
F48E: 48         ASLA                ; 
F48F: 00 
F490: 00 
F491: 00 
F492: 05 
F493: FF 00 00   STX  $0000          ; 
F496: 02 
F497: 80 00      SUBA #$00           ; 
F499: 30         TSX                 ; 
F49A: 0A         CLV                 ; 
F49B: 7F 00 7F   CLR  $007F          ; 
F49E: 02 
F49F: 80 00      SUBA #$00           ; 
F4A1: 30         TSX                 ; 
F4A2: C0 80      SUBB #$80           ; 
F4A4: 00 
F4A5: 20 01      BRA  $F4A8          ; 
F4A7: 10         SBA                 ; 
F4A8: 00 
F4A9: 15 
F4AA: C0 10      SUBB #$10           ; 
F4AC: 00 
F4AD: 00 
F4AE: C0 80      SUBB #$80           ; 
F4B0: 00 
F4B1: 00 
F4B2: FF 01 02   STX  $0102          ; 
F4B5: C3 FF 00   ADDD #$FF00         ; 
F4B8: 01         NOP                 ; 
F4B9: 03 
F4BA: FF 80 FF   STX  $80FF          ; 
F4BD: 00 
F4BE: 20 03      BRA  $F4C3          ; 
F4C0: FF 50 FF   STX  $50FF          ; 
F4C3: 00 
F4C4: 50         NEGB                ; 
F4C5: 03 
F4C6: 01         NOP                 ; 
F4C7: 20 FF      BRA  $F4C8          ; 
F4C9: 00 
F4CA: FE 04 02   LDX  $0402          ; 
F4CD: 04         LSRD                ; 
F4CE: FF 00 48   STX  $0048          ; 
F4D1: 03 
F4D2: 01         NOP                 ; 
F4D3: 0C         CLC                 ; 
F4D4: FF 00 48   STX  $0048          ; 
F4D7: 02 
F4D8: 01         NOP                 ; 
F4D9: 0C         CLC                 ; 
F4DA: FF 00 E0   STX  $00E0          ; 
F4DD: 01         NOP                 ; 
F4DE: 02 
F4DF: 10         SBA                 ; 
F4E0: FF 00 50   STX  $0050          ; 
F4E3: FF 00 00   STX  $0000          ; 
F4E6: 60 80      NEG  $80,X          ; 
F4E8: FF 02 01   STX  $0201          ; 
F4EB: 06         TAP                 ; 
F4EC: FF 00 16   STX  $0016          ; 
F4EF: 48         ASLA                ; 
F4F0: 48         ASLA                ; 
F4F1: 48         ASLA                ; 
F4F2: 1B         ABA                 ; 
F4F3: CE 00 12   LDX  #$0012         ; 
F4F6: DF 0E      STX  >$0E           ; 
F4F8: CE FC 08   LDX  #$FC08         ; 
F4FB: BD FB 92   JSR  $FB92          ; 
F4FE: C6 09      LDB  #$09           ; 
F500: 7E F9 65   JMP  $F965          ; 
F503: 96 1A      LDA  >$1A           ; 
F505: B7 04 00   STA  $0400          ; 
F508: 96 12      LDA  >$12           ; 
F50A: 97 1B      STA  >$1B           ; 
F50C: 96 13      LDA  >$13           ; 
F50E: 97 1C      STA  >$1C           ; 
F510: DE 17      LDX  >$17           ; 
F512: 96 1B      LDA  >$1B           ; 
F514: 73 04 00   COM  $0400          ; 
F517: 09         DEX                 ; 
F518: 27 10      BEQ  $F52A          ; 
F51A: 4A         DECA                ; 
F51B: 26 FA      BNE  $F517          ; 
F51D: 73 04 00   COM  $0400          ; 
F520: 96 1C      LDA  >$1C           ; 
F522: 09         DEX                 ; 
F523: 27 05      BEQ  $F52A          ; 
F525: 4A         DECA                ; 
F526: 26 FA      BNE  $F522          ; 
F528: 20 E8      BRA  $F512          ; 
F52A: B6 04 00   LDA  $0400          ; 
F52D: 2B 01      BMI  $F530          ; 
F52F: 43         COMA                ; 
F530: 8B 00      ADDA #$00           ; 
F532: B7 04 00   STA  $0400          ; 
F535: 96 1B      LDA  >$1B           ; 
F537: 9B 14      ADDA >$14           ; 
F539: 97 1B      STA  >$1B           ; 
F53B: 96 1C      LDA  >$1C           ; 
F53D: 9B 15      ADDA >$15           ; 
F53F: 97 1C      STA  >$1C           ; 
F541: 91 16      CMPA >$16           ; 
F543: 26 CB      BNE  $F510          ; 
F545: 96 19      LDA  >$19           ; 
F547: 27 06      BEQ  $F54F          ; 
F549: 9B 12      ADDA >$12           ; 
F54B: 97 12      STA  >$12           ; 
F54D: 26 B9      BNE  $F508          ; 
F54F: 39         RTS                 ; 
F550: 86 FF      LDA  #$FF           ; 
F552: 97 19      STA  >$19           ; 
F554: 86 60      LDA  #$60           ; 
F556: C6 FF      LDB  #$FF           ; 
F558: 20 12      BRA  $F56C          ; 
F55A: 86 01      LDA  #$01           ; 
F55C: 97 19      STA  >$19           ; 
F55E: C6 03      LDB  #$03           ; 
F560: 20 0A      BRA  $F56C          ; 
F562: 86 FE      LDA  #$FE           ; 
F564: 97 19      STA  >$19           ; 
F566: 86 C0      LDA  #$C0           ; 
F568: C6 10      LDB  #$10           ; 
F56A: 20 00      BRA  $F56C          ; 
F56C: 97 18      STA  >$18           ; 
F56E: 86 FF      LDA  #$FF           ; 
F570: B7 04 00   STA  $0400          ; 
F573: D7 14      STB  >$14           ; 
F575: D6 14      LDB  >$14           ; 
F577: 96 06      LDA  >$06           ; 
F579: 44         LSRA                ; 
F57A: 44         LSRA                ; 
F57B: 44         LSRA                ; 
F57C: 98 06      EORA >$06           ; 
F57E: 44         LSRA                ; 
F57F: 76 00 05   ROR  $0005          ; 
F582: 76 00 06   ROR  $0006          ; 
F585: 24 03      BCC  $F58A          ; 
F587: 73 04 00   COM  $0400          ; 
F58A: 96 18      LDA  >$18           ; 
F58C: 4A         DECA                ; 
F58D: 26 FD      BNE  $F58C          ; 
F58F: 5A         DECB                ; 
F590: 26 E5      BNE  $F577          ; 
F592: 96 18      LDA  >$18           ; 
F594: 9B 19      ADDA >$19           ; 
F596: 97 18      STA  >$18           ; 
F598: 26 DB      BNE  $F575          ; 
F59A: 39         RTS                 ; 
F59B: 86 20      LDA  #$20           ; 
F59D: 97 14      STA  >$14           ; 
F59F: 97 17      STA  >$17           ; 
F5A1: 86 01      LDA  #$01           ; 
F5A3: CE 00 01   LDX  #$0001         ; 
F5A6: C6 FF      LDB  #$FF           ; 
F5A8: 20 00      BRA  $F5AA          ; 
F5AA: 97 12      STA  >$12           ; 
F5AC: DF 15      STX  >$15           ; 
F5AE: D7 13      STB  >$13           ; 
F5B0: D6 14      LDB  >$14           ; 
F5B2: 96 06      LDA  >$06           ; 
F5B4: 44         LSRA                ; 
F5B5: 44         LSRA                ; 
F5B6: 44         LSRA                ; 
F5B7: 98 06      EORA >$06           ; 
F5B9: 44         LSRA                ; 
F5BA: 76 00 05   ROR  $0005          ; 
F5BD: 76 00 06   ROR  $0006          ; 
F5C0: 86 00      LDA  #$00           ; 
F5C2: 24 02      BCC  $F5C6          ; 
F5C4: 96 13      LDA  >$13           ; 
F5C6: B7 04 00   STA  $0400          ; 
F5C9: DE 15      LDX  >$15           ; 
F5CB: 09         DEX                 ; 
F5CC: 26 FD      BNE  $F5CB          ; 
F5CE: 5A         DECB                ; 
F5CF: 26 E1      BNE  $F5B2          ; 
F5D1: D6 13      LDB  >$13           ; 
F5D3: D0 12      SUBB >$12           ; 
F5D5: 27 09      BEQ  $F5E0          ; 
F5D7: DE 15      LDX  >$15           ; 
F5D9: 08         INX                 ; 
F5DA: 96 17      LDA  >$17           ; 
F5DC: 27 D0      BEQ  $F5AE          ; 
F5DE: 20 CC      BRA  $F5AC          ; 
F5E0: 39         RTS                 ; 
F5E1: CE F6 00   LDX  #$F600         ; 
F5E4: DF 23      STX  >$23           ; 
F5E6: BD F7 2A   JSR  $F72A          ; 
F5E9: CE A5 00   LDX  #$A500         ; 
F5EC: DF 05      STX  >$05           ; 
F5EE: CE F6 29   LDX  #$F629         ; 
F5F1: BD F6 33   JSR  $F633          ; 
F5F4: BD F6 CE   JSR  $F6CE          ; 
F5F7: CE F6 2E   LDX  #$F62E         ; 
F5FA: BD F6 33   JSR  $F633          ; 
F5FD: 7E F6 DB   JMP  $F6DB          ; 
F600: 90 10      SUBA >$10           ; 
F602: 02 
F603: 14 
F604: 40         NEGA                ; 
F605: B4 40 FF   ANDA $40FF          ; 
F608: 14 
F609: 30         TSX                 ; 
F60A: D0 32      SUBB >$32           ; 
F60C: 02 
F60D: 10         SBA                 ; 
F60E: 60 EE      NEG  $EE,X          ; 
F610: 20 02      BRA  $F614          ; 
F612: 08         INX                 ; 
F613: 54         LSRB                ; 
F614: E9 54      ADCB $54,X          ; 
F616: FF 20 28   STX  $2028          ; 
F619: C0 30      SUBB #$30           ; 
F61B: 02 
F61C: 14 
F61D: 58         ASLB                ; 
F61E: AC 20      CPX  $20,X          ; 
F620: 02 
F621: 08         INX                 ; 
F622: 58         ASLB                ; 
F623: A6 58      LDA  $58,X          ; 
F625: FF 18 22   STX  $1822          ; 
F628: 00 
F629: 30         TSX                 ; 
F62A: 10         SBA                 ; 
F62B: FC 00 01   LDD  $0001          ; 
F62E: 30         TSX                 ; 
F62F: FC 01 00   LDD  $0100          ; 
F632: 01         NOP                 ; 
F633: A6 00      LDA  $00,X          ; 
F635: 97 2A      STA  >$2A           ; 
F637: A6 01      LDA  $01,X          ; 
F639: 97 13      STA  >$13           ; 
F63B: A6 02      LDA  $02,X          ; 
F63D: 97 12      STA  >$12           ; 
F63F: A6 03      LDA  $03,X          ; 
F641: 97 17      STA  >$17           ; 
F643: A6 04      LDA  $04,X          ; 
F645: 97 2F      STA  >$2F           ; 
F647: 39         RTS                 ; 
F648: 8D E9      BSR  $F633          ; 
F64A: 8D 30      BSR  $F67C          ; 
F64C: 8D 58      BSR  $F6A6          ; 
F64E: 96 2E      LDA  >$2E           ; 
F650: 91 2F      CMPA >$2F           ; 
F652: 26 F8      BNE  $F64C          ; 
F654: 59         ROLB                ; 
F655: F7 04 00   STB  $0400          ; 
F658: 8D 2D      BSR  $F687          ; 
F65A: 8D 38      BSR  $F694          ; 
F65C: 8D 5C      BSR  $F6BA          ; 
F65E: 7D 00 13   TST  $0013          ; 
F661: 27 E4      BEQ  $F647          ; 
F663: 7D 00 14   TST  $0014          ; 
F666: 26 E4      BNE  $F64C          ; 
F668: 7D 00 17   TST  $0017          ; 
F66B: 27 DF      BEQ  $F64C          ; 
F66D: 2B 05      BMI  $F674          ; 
F66F: 7C 00 2F   INC  $002F          ; 
F672: 20 D8      BRA  $F64C          ; 
F674: 7A 00 2F   DEC  $002F          ; 
F677: 7A 00 2E   DEC  $002E          ; 
F67A: 20 D0      BRA  $F64C          ; 
F67C: 7F 00 14   CLR  $0014          ; 
F67F: 96 2F      LDA  >$2F           ; 
F681: 97 2E      STA  >$2E           ; 
F683: 7F 00 2D   CLR  $002D          ; 
F686: 39         RTS                 ; 
F687: 96 06      LDA  >$06           ; 
F689: 44         LSRA                ; 
F68A: 44         LSRA                ; 
F68B: 44         LSRA                ; 
F68C: 98 06      EORA >$06           ; 
F68E: 97 28      STA  >$28           ; 
F690: 08         INX                 ; 
F691: 84 07      ANDA #$07           ; 
F693: 39         RTS                 ; 
F694: 96 28      LDA  >$28           ; 
F696: 44         LSRA                ; 
F697: 76 00 05   ROR  $0005          ; 
F69A: 76 00 06   ROR  $0006          ; 
F69D: 86 00      LDA  #$00           ; 
F69F: 24 02      BCC  $F6A3          ; 
F6A1: 96 13      LDA  >$13           ; 
F6A3: 97 2D      STA  >$2D           ; 
F6A5: 39         RTS                 ; 
F6A6: 96 2F      LDA  >$2F           ; 
F6A8: 7A 00 2E   DEC  $002E          ; 
F6AB: 27 04      BEQ  $F6B1          ; 
F6AD: 08         INX                 ; 
F6AE: 09         DEX                 ; 
F6AF: 20 08      BRA  $F6B9          ; 
F6B1: 97 2E      STA  >$2E           ; 
F6B3: D6 2D      LDB  >$2D           ; 
F6B5: 54         LSRB                ; 
F6B6: 7C 00 14   INC  $0014          ; 
F6B9: 39         RTS                 ; 
F6BA: 96 2A      LDA  >$2A           ; 
F6BC: 91 14      CMPA >$14           ; 
F6BE: 27 04      BEQ  $F6C4          ; 
F6C0: 08         INX                 ; 
F6C1: 09         DEX                 ; 
F6C2: 20 09      BRA  $F6CD          ; 
F6C4: 7F 00 14   CLR  $0014          ; 
F6C7: 96 13      LDA  >$13           ; 
F6C9: 90 12      SUBA >$12           ; 
F6CB: 97 13      STA  >$13           ; 
F6CD: 39         RTS                 ; 
F6CE: 7F 00 21   CLR  $0021          ; 
F6D1: 7F 00 2B   CLR  $002B          ; 
F6D4: 86 0E      LDA  #$0E           ; 
F6D6: 97 22      STA  >$22           ; 
F6D8: 7F 00 27   CLR  $0027          ; 
F6DB: 8D 9F      BSR  $F67C          ; 
F6DD: 8D A8      BSR  $F687          ; 
F6DF: BD F7 64   JSR  $F764          ; 
F6E2: 8D B0      BSR  $F694          ; 
F6E4: BD F7 64   JSR  $F764          ; 
F6E7: 8D BD      BSR  $F6A6          ; 
F6E9: 8D 79      BSR  $F764          ; 
F6EB: 8D CD      BSR  $F6BA          ; 
F6ED: 8D 75      BSR  $F764          ; 
F6EF: 8D 0A      BSR  $F6FB          ; 
F6F1: 8D 71      BSR  $F764          ; 
F6F3: 8D 1D      BSR  $F712          ; 
F6F5: 8D 6D      BSR  $F764          ; 
F6F7: 8D 52      BSR  $F74B          ; 
F6F9: 20 E2      BRA  $F6DD          ; 
F6FB: 96 26      LDA  >$26           ; 
F6FD: 7A 00 22   DEC  $0022          ; 
F700: 27 07      BEQ  $F709          ; 
F702: B6 00 13   LDA  $0013          ; 
F705: 26 0A      BNE  $F711          ; 
F707: 20 68      BRA  $F771          ; 
F709: 97 22      STA  >$22           ; 
F70B: 96 21      LDA  >$21           ; 
F70D: 9B 2B      ADDA >$2B           ; 
F70F: 97 21      STA  >$21           ; 
F711: 39         RTS                 ; 
F712: 96 21      LDA  >$21           ; 
F714: 91 29      CMPA >$29           ; 
F716: 27 07      BEQ  $F71F          ; 
F718: 08         INX                 ; 
F719: 96 13      LDA  >$13           ; 
F71B: 26 2A      BNE  $F747          ; 
F71D: 20 29      BRA  $F748          ; 
F71F: 7F 00 21   CLR  $0021          ; 
F722: 7F 00 2B   CLR  $002B          ; 
F725: 7F 00 27   CLR  $0027          ; 
F728: DE 23      LDX  >$23           ; 
F72A: A6 00      LDA  $00,X          ; 
F72C: 97 20      STA  >$20           ; 
F72E: 27 17      BEQ  $F747          ; 
F730: A6 01      LDA  $01,X          ; 
F732: 97 25      STA  >$25           ; 
F734: A6 02      LDA  $02,X          ; 
F736: 97 2C      STA  >$2C           ; 
F738: A6 03      LDA  $03,X          ; 
F73A: 97 26      STA  >$26           ; 
F73C: A6 04      LDA  $04,X          ; 
F73E: 97 29      STA  >$29           ; 
F740: 86 05      LDA  #$05           ; 
F742: BD FB 92   JSR  $FB92          ; 
F745: DF 23      STX  >$23           ; 
F747: 39         RTS                 ; 
F748: 32         PULA                ; 
F749: 32         PULA                ; 
F74A: 39         RTS                 ; 
F74B: 96 20      LDA  >$20           ; 
F74D: 27 06      BEQ  $F755          ; 
F74F: 91 13      CMPA >$13           ; 
F751: 26 04      BNE  $F757          ; 
F753: 20 03      BRA  $F758          ; 
F755: 08         INX                 ; 
F756: 09         DEX                 ; 
F757: 39         RTS                 ; 
F758: 7F 00 20   CLR  $0020          ; 
F75B: 96 25      LDA  >$25           ; 
F75D: 97 21      STA  >$21           ; 
F75F: 96 2C      LDA  >$2C           ; 
F761: 97 2B      STA  >$2B           ; 
F763: 39         RTS                 ; 
F764: 96 27      LDA  >$27           ; 
F766: 9B 21      ADDA >$21           ; 
F768: 97 27      STA  >$27           ; 
F76A: 2A 01      BPL  $F76D          ; 
F76C: 43         COMA                ; 
F76D: 1B         ABA                 ; 
F76E: B7 04 00   STA  $0400          ; 
F771: 39         RTS                 ; 
F772: C6 01      LDB  #$01           ; 
F774: D7 00      STB  >$00           ; 
F776: CE F7 85   LDX  #$F785         ; 
F779: 20 2A      BRA  $F7A5          ; 
F77B: CE F7 8B   LDX  #$F78B         ; 
F77E: 20 25      BRA  $F7A5          ; 
F780: CE F7 91   LDX  #$F791         ; 
F783: 20 20      BRA  $F7A5          ; 
F785: 00 
F786: 00 
F787: 00 
F788: 01         NOP                 ; 
F789: 00 
F78A: 00 
F78B: 00 
F78C: 00 
F78D: 00 
F78E: 03 
F78F: 00 
F790: 00 
F791: 01         NOP                 ; 
F792: 00 
F793: 01         NOP                 ; 
F794: FF 03 E8   STX  $03E8          ; 
F797: 01         NOP                 ; 
F798: 01         NOP                 ; 
F799: 01         NOP                 ; 
F79A: 40         NEGA                ; 
F79B: 10         SBA                 ; 
F79C: 00 
F79D: 01         NOP                 ; 
F79E: 80 01      SUBA #$01           ; 
F7A0: 40         NEGA                ; 
F7A1: FF CE F7   STX  $CEF7          ; 
F7A4: 97 A6      STA  >$A6           ; 
F7A6: 00 
F7A7: 97 19      STA  >$19           ; 
F7A9: A6 01      LDA  $01,X          ; 
F7AB: 97 15      STA  >$15           ; 
F7AD: A6 02      LDA  $02,X          ; 
F7AF: E6 03      LDB  $03,X          ; 
F7B1: EE 04      LDX  $04,X          ; 
F7B3: 97 18      STA  >$18           ; 
F7B5: D7 12      STB  >$12           ; 
F7B7: DF 16      STX  >$16           ; 
F7B9: 7F 00 14   CLR  $0014          ; 
F7BC: DE 16      LDX  >$16           ; 
F7BE: B6 04 00   LDA  $0400          ; 
F7C1: 16         TAB                 ; 
F7C2: 54         LSRB                ; 
F7C3: 54         LSRB                ; 
F7C4: 54         LSRB                ; 
F7C5: D8 06      EORB >$06           ; 
F7C7: 54         LSRB                ; 
F7C8: 76 00 05   ROR  $0005          ; 
F7CB: 76 00 06   ROR  $0006          ; 
F7CE: D6 12      LDB  >$12           ; 
F7D0: 7D 00 19   TST  $0019          ; 
F7D3: 27 04      BEQ  $F7D9          ; 
F7D5: D4 05      ANDB >$05           ; 
F7D7: DB 15      ADDB >$15           ; 
F7D9: D7 13      STB  >$13           ; 
F7DB: D6 14      LDB  >$14           ; 
F7DD: 91 06      CMPA >$06           ; 
F7DF: 22 12      BHI  $F7F3          ; 
F7E1: 09         DEX                 ; 
F7E2: 27 26      BEQ  $F80A          ; 
F7E4: B7 04 00   STA  $0400          ; 
F7E7: DB 14      ADDB >$14           ; 
F7E9: 99 13      ADCA >$13           ; 
F7EB: 25 16      BCS  $F803          ; 
F7ED: 91 06      CMPA >$06           ; 
F7EF: 23 F0      BLS  $F7E1          ; 
F7F1: 20 10      BRA  $F803          ; 
F7F3: 09         DEX                 ; 
F7F4: 27 14      BEQ  $F80A          ; 
F7F6: B7 04 00   STA  $0400          ; 
F7F9: D0 14      SUBB >$14           ; 
F7FB: 92 13      SBCA >$13           ; 
F7FD: 25 04      BCS  $F803          ; 
F7FF: 91 06      CMPA >$06           ; 
F801: 22 F0      BHI  $F7F3          ; 
F803: 96 06      LDA  >$06           ; 
F805: B7 04 00   STA  $0400          ; 
F808: 20 B7      BRA  $F7C1          ; 
F80A: D6 18      LDB  >$18           ; 
F80C: 27 B3      BEQ  $F7C1          ; 
F80E: 96 12      LDA  >$12           ; 
F810: D6 14      LDB  >$14           ; 
F812: 44         LSRA                ; 
F813: 56         RORB                ; 
F814: 44         LSRA                ; 
F815: 56         RORB                ; 
F816: 44         LSRA                ; 
F817: 56         RORB                ; 
F818: 43         COMA                ; 
F819: 50         NEGB                ; 
F81A: 82 FF      SBCA #$FF           ; 
F81C: DB 14      ADDB >$14           ; 
F81E: 99 12      ADCA >$12           ; 
F820: D7 14      STB  >$14           ; 
F822: 97 12      STA  >$12           ; 
F824: 26 96      BNE  $F7BC          ; 
F826: C1 07      CMPB #$07           ; 
F828: 26 92      BNE  $F7BC          ; 
F82A: 39         RTS                 ; 
F82B: 86 FC      LDA  #$FC           ; 
F82D: 97 0E      STA  >$0E           ; 
F82F: CE 00 64   LDX  #$0064         ; 
F832: DF 0A      STX  >$0A           ; 
F834: DB 0B      ADDB >$0B           ; 
F836: 96 10      LDA  >$10           ; 
F838: 99 0A      ADCA >$0A           ; 
F83A: 97 10      STA  >$10           ; 
F83C: DE 0A      LDX  >$0A           ; 
F83E: 25 04      BCS  $F844          ; 
F840: 20 00      BRA  $F842          ; 
F842: 20 03      BRA  $F847          ; 
F844: 08         INX                 ; 
F845: 27 11      BEQ  $F858          ; 
F847: DF 0A      STX  >$0A           ; 
F849: 84 0F      ANDA #$0F           ; 
F84B: 8B 47      ADDA #$47           ; 
F84D: 97 0F      STA  >$0F           ; 
F84F: DE 0E      LDX  >$0E           ; 
F851: A6 00      LDA  $00,X          ; 
F853: B7 04 00   STA  $0400          ; 
F856: 20 DC      BRA  $F834          ; 
F858: 39         RTS                 ; 
F859: 4F         CLRA                ; 
F85A: B7 04 00   STA  $0400          ; 
F85D: 97 10      STA  >$10           ; 
F85F: 4F         CLRA                ; 
F860: 91 10      CMPA >$10           ; 
F862: 26 03      BNE  $F867          ; 
F864: 73 04 00   COM  $0400          ; 
F867: C6 12      LDB  #$12           ; 
F869: 5A         DECB                ; 
F86A: 26 FD      BNE  $F869          ; 
F86C: 4C         INCA                ; 
F86D: 2A F1      BPL  $F860          ; 
F86F: 73 04 00   COM  $0400          ; 
F872: 7C 00 10   INC  $0010          ; 
F875: 2A E8      BPL  $F85F          ; 
F877: 39         RTS                 ; 
F878: CE 00 12   LDX  #$0012         ; 
F87B: 6F 00      CLR  $00,X          ; 
F87D: 08         INX                 ; 
F87E: 8C 00 1A   CPX  #$001A         ; 
F881: 26 F8      BNE  $F87B          ; 
F883: 86 40      LDA  #$40           ; 
F885: 97 12      STA  >$12           ; 
F887: CE 00 12   LDX  #$0012         ; 
F88A: 86 80      LDA  #$80           ; 
F88C: 97 10      STA  >$10           ; 
F88E: 5F         CLRB                ; 
F88F: A6 01      LDA  $01,X          ; 
F891: AB 00      ADDA $00,X          ; 
F893: A7 01      STA  $01,X          ; 
F895: 2A 02      BPL  $F899          ; 
F897: DB 10      ADDB >$10           ; 
F899: 74 00 10   LSR  $0010          ; 
F89C: 08         INX                 ; 
F89D: 08         INX                 ; 
F89E: 8C 00 1A   CPX  #$001A         ; 
F8A1: 26 EC      BNE  $F88F          ; 
F8A3: F7 04 00   STB  $0400          ; 
F8A6: 7C 00 11   INC  $0011          ; 
F8A9: 26 DC      BNE  $F887          ; 
F8AB: CE 00 12   LDX  #$0012         ; 
F8AE: 5F         CLRB                ; 
F8AF: A6 00      LDA  $00,X          ; 
F8B1: 27 0B      BEQ  $F8BE          ; 
F8B3: 81 37      CMPA #$37           ; 
F8B5: 26 04      BNE  $F8BB          ; 
F8B7: C6 41      LDB  #$41           ; 
F8B9: E7 02      STB  $02,X          ; 
F8BB: 6A 00      DEC  $00,X          ; 
F8BD: 5C         INCB                ; 
F8BE: 08         INX                 ; 
F8BF: 08         INX                 ; 
F8C0: 8C 00 1A   CPX  #$001A         ; 
F8C3: 26 EA      BNE  $F8AF          ; 
F8C5: 5D         TSTB                ; 
F8C6: 26 BF      BNE  $F887          ; 
F8C8: 39         RTS                 ; 
F8C9: 7A 00 04   DEC  $0004          ; 
F8CC: 39         RTS                 ; 
F8CD: 8D 03      BSR  $F8D2          ; 
F8CF: 7E FB 7F   JMP  $FB7F          ; 
F8D2: 7F 00 04   CLR  $0004          ; 
F8D5: 97 10      STA  >$10           ; 
F8D7: CE FC 57   LDX  #$FC57         ; 
F8DA: A6 00      LDA  $00,X          ; 
F8DC: 27 2D      BEQ  $F90B          ; 
F8DE: 7A 00 10   DEC  $0010          ; 
F8E1: 27 06      BEQ  $F8E9          ; 
F8E3: 4C         INCA                ; 
F8E4: BD FB 92   JSR  $FB92          ; 
F8E7: 20 F1      BRA  $F8DA          ; 
F8E9: 08         INX                 ; 
F8EA: DF 0E      STX  >$0E           ; 
F8EC: BD FB 92   JSR  $FB92          ; 
F8EF: DF 0C      STX  >$0C           ; 
F8F1: DE 0E      LDX  >$0E           ; 
F8F3: A6 00      LDA  $00,X          ; 
F8F5: 97 14      STA  >$14           ; 
F8F7: A6 01      LDA  $01,X          ; 
F8F9: EE 02      LDX  $02,X          ; 
F8FB: DF 12      STX  >$12           ; 
F8FD: 8D 0E      BSR  $F90D          ; 
F8FF: DE 0E      LDX  >$0E           ; 
F901: 08         INX                 ; 
F902: 08         INX                 ; 
F903: 08         INX                 ; 
F904: 08         INX                 ; 
F905: DF 0E      STX  >$0E           ; 
F907: 9C 0C      CPX  >$0C           ; 
F909: 26 E8      BNE  $F8F3          ; 
F90B: 39         RTS                 ; 
F90C: 39         RTS                 ; 
F90D: CE 00 15   LDX  #$0015         ; 
F910: 80 02      SUBA #$02           ; 
F912: 23 15      BLS  $F929          ; 
F914: 81 03      CMPA #$03           ; 
F916: 27 09      BEQ  $F921          ; 
F918: C6 01      LDB  #$01           ; 
F91A: E7 00      STB  $00,X          ; 
F91C: 08         INX                 ; 
F91D: 80 02      SUBA #$02           ; 
F91F: 20 F1      BRA  $F912          ; 
F921: C6 91      LDB  #$91           ; 
F923: E7 00      STB  $00,X          ; 
F925: 6F 01      CLR  $01,X          ; 
F927: 08         INX                 ; 
F928: 08         INX                 ; 
F929: C6 7E      LDB  #$7E           ; 
F92B: E7 00      STB  $00,X          ; 
F92D: C6 F9      LDB  #$F9           ; 
F92F: E7 01      STB  $01,X          ; 
F931: C6 37      LDB  #$37           ; 
F933: E7 02      STB  $02,X          ; 
F935: DE 12      LDX  >$12           ; 
F937: 4F         CLRA                ; 
F938: F6 00 11   LDB  $0011          ; 
F93B: 5C         INCB                ; 
F93C: D7 11      STB  >$11           ; 
F93E: D4 14      ANDB >$14           ; 
F940: 54         LSRB                ; 
F941: 89 00      ADCA #$00           ; 
F943: 54         LSRB                ; 
F944: 89 00      ADCA #$00           ; 
F946: 54         LSRB                ; 
F947: 89 00      ADCA #$00           ; 
F949: 54         LSRB                ; 
F94A: 89 00      ADCA #$00           ; 
F94C: 54         LSRB                ; 
F94D: 89 00      ADCA #$00           ; 
F94F: 54         LSRB                ; 
F950: 89 00      ADCA #$00           ; 
F952: 54         LSRB                ; 
F953: 89 00      ADCA #$00           ; 
F955: 1B         ABA                 ; 
F956: 48         ASLA                ; 
F957: 48         ASLA                ; 
F958: 48         ASLA                ; 
F959: 48         ASLA                ; 
F95A: 48         ASLA                ; 
F95B: B7 04 00   STA  $0400          ; 
F95E: 09         DEX                 ; 
F95F: 27 03      BEQ  $F964          ; 
F961: 7E 00 15   JMP  $0015          ; 
F964: 39         RTS                 ; 
F965: 36         PSHA                ; 
F966: A6 00      LDA  $00,X          ; 
F968: DF 0C      STX  >$0C           ; 
F96A: DE 0E      LDX  >$0E           ; 
F96C: A7 00      STA  $00,X          ; 
F96E: 08         INX                 ; 
F96F: DF 0E      STX  >$0E           ; 
F971: DE 0C      LDX  >$0C           ; 
F973: 08         INX                 ; 
F974: 5A         DECB                ; 
F975: 26 EF      BNE  $F966          ; 
F977: 32         PULA                ; 
F978: 39         RTS                 ; 
F979: 4F         CLRA                ; 
F97A: 97 00      STA  >$00           ; 
F97C: 97 01      STA  >$01           ; 
F97E: 39         RTS                 ; 
F97F: 7F 00 00   CLR  $0000          ; 
F982: 96 01      LDA  >$01           ; 
F984: 84 7F      ANDA #$7F           ; 
F986: 81 1D      CMPA #$1D           ; 
F988: 26 01      BNE  $F98B          ; 
F98A: 4F         CLRA                ; 
F98B: 4C         INCA                ; 
F98C: 97 01      STA  >$01           ; 
F98E: 39         RTS                 ; 
F98F: 86 0E      LDA  #$0E           ; 
F991: BD F9 DC   JSR  $F9DC          ; 
F994: 96 01      LDA  >$01           ; 
F996: 48         ASLA                ; 
F997: 48         ASLA                ; 
F998: 43         COMA                ; 
F999: BD FA 94   JSR  $FA94          ; 
F99C: 7C 00 16   INC  $0016          ; 
F99F: BD FA 96   JSR  $FA96          ; 
F9A2: 20 F8      BRA  $F99C          ; 
F9A4: 86 03      LDA  #$03           ; 
F9A6: BD F4 EE   JSR  $F4EE          ; 
F9A9: D6 02      LDB  >$02           ; 
F9AB: C1 1F      CMPB #$1F           ; 
F9AD: 26 01      BNE  $F9B0          ; 
F9AF: 5F         CLRB                ; 
F9B0: 5C         INCB                ; 
F9B1: D7 02      STB  >$02           ; 
F9B3: 86 20      LDA  #$20           ; 
F9B5: 10         SBA                 ; 
F9B6: 5F         CLRB                ; 
F9B7: 81 14      CMPA #$14           ; 
F9B9: 23 05      BLS  $F9C0          ; 
F9BB: CB 0E      ADDB #$0E           ; 
F9BD: 4A         DECA                ; 
F9BE: 20 F7      BRA  $F9B7          ; 
F9C0: CB 05      ADDB #$05           ; 
F9C2: 4A         DECA                ; 
F9C3: 26 FB      BNE  $F9C0          ; 
F9C5: D7 12      STB  >$12           ; 
F9C7: BD F5 03   JSR  $F503          ; 
F9CA: 20 FB      BRA  $F9C7          ; 
F9CC: 96 03      LDA  >$03           ; 
F9CE: 26 09      BNE  $F9D9          ; 
F9D0: 7C 00 03   INC  $0003          ; 
F9D3: 86 0D      LDA  #$0D           ; 
F9D5: 8D 05      BSR  $F9DC          ; 
F9D7: 20 69      BRA  $FA42          ; 
F9D9: 7E FA 89   JMP  $FA89          ; 
F9DC: 16         TAB                 ; 
F9DD: 58         ASLB                ; 
F9DE: 1B         ABA                 ; 
F9DF: 1B         ABA                 ; 
F9E0: 1B         ABA                 ; 
F9E1: CE FE 45   LDX  #$FE45         ; 
F9E4: BD FB 92   JSR  $FB92          ; 
F9E7: A6 00      LDA  $00,X          ; 
F9E9: 16         TAB                 ; 
F9EA: 84 0F      ANDA #$0F           ; 
F9EC: 97 13      STA  >$13           ; 
F9EE: 54         LSRB                ; 
F9EF: 54         LSRB                ; 
F9F0: 54         LSRB                ; 
F9F1: 54         LSRB                ; 
F9F2: D7 12      STB  >$12           ; 
F9F4: A6 01      LDA  $01,X          ; 
F9F6: 16         TAB                 ; 
F9F7: 54         LSRB                ; 
F9F8: 54         LSRB                ; 
F9F9: 54         LSRB                ; 
F9FA: 54         LSRB                ; 
F9FB: D7 14      STB  >$14           ; 
F9FD: 84 0F      ANDA #$0F           ; 
F9FF: 97 10      STA  >$10           ; 
FA01: DF 0A      STX  >$0A           ; 
FA03: CE FD 32   LDX  #$FD32         ; 
FA06: 7A 00 10   DEC  $0010          ; 
FA09: 2B 08      BMI  $FA13          ; 
FA0B: A6 00      LDA  $00,X          ; 
FA0D: 4C         INCA                ; 
FA0E: BD FB 92   JSR  $FB92          ; 
FA11: 20 F3      BRA  $FA06          ; 
FA13: DF 17      STX  >$17           ; 
FA15: BD FA D0   JSR  $FAD0          ; 
FA18: DE 0A      LDX  >$0A           ; 
FA1A: A6 02      LDA  $02,X          ; 
FA1C: 97 19      STA  >$19           ; 
FA1E: BD FA E2   JSR  $FAE2          ; 
FA21: DE 0A      LDX  >$0A           ; 
FA23: A6 03      LDA  $03,X          ; 
FA25: 97 15      STA  >$15           ; 
FA27: A6 04      LDA  $04,X          ; 
FA29: 97 16      STA  >$16           ; 
FA2B: A6 05      LDA  $05,X          ; 
FA2D: 16         TAB                 ; 
FA2E: A6 06      LDA  $06,X          ; 
FA30: CE FF 02   LDX  #$FF02         ; 
FA33: BD FB 92   JSR  $FB92          ; 
FA36: 17         TBA                 ; 
FA37: DF 1A      STX  >$1A           ; 
FA39: 7F 00 22   CLR  $0022          ; 
FA3C: BD FB 92   JSR  $FB92          ; 
FA3F: DF 1C      STX  >$1C           ; 
FA41: 39         RTS                 ; 
FA42: 96 12      LDA  >$12           ; 
FA44: 97 21      STA  >$21           ; 
FA46: DE 1A      LDX  >$1A           ; 
FA48: DF 0C      STX  >$0C           ; 
FA4A: DE 0C      LDX  >$0C           ; 
FA4C: A6 00      LDA  $00,X          ; 
FA4E: 9B 22      ADDA >$22           ; 
FA50: 97 20      STA  >$20           ; 
FA52: 9C 1C      CPX  >$1C           ; 
FA54: 27 26      BEQ  $FA7C          ; 
FA56: D6 13      LDB  >$13           ; 
FA58: 08         INX                 ; 
FA59: DF 0C      STX  >$0C           ; 
FA5B: CE 00 23   LDX  #$0023         ; 
FA5E: 96 20      LDA  >$20           ; 
FA60: 4A         DECA                ; 
FA61: 26 FD      BNE  $FA60          ; 
FA63: A6 00      LDA  $00,X          ; 
FA65: B7 04 00   STA  $0400          ; 
FA68: 08         INX                 ; 
FA69: 9C 1E      CPX  >$1E           ; 
FA6B: 26 F1      BNE  $FA5E          ; 
FA6D: 5A         DECB                ; 
FA6E: 27 DA      BEQ  $FA4A          ; 
FA70: 08         INX                 ; 
FA71: 09         DEX                 ; 
FA72: 08         INX                 ; 
FA73: 09         DEX                 ; 
FA74: 08         INX                 ; 
FA75: 09         DEX                 ; 
FA76: 08         INX                 ; 
FA77: 09         DEX                 ; 
FA78: 01         NOP                 ; 
FA79: 01         NOP                 ; 
FA7A: 20 DF      BRA  $FA5B          ; 
FA7C: 96 14      LDA  >$14           ; 
FA7E: 8D 62      BSR  $FAE2          ; 
FA80: 7A 00 21   DEC  $0021          ; 
FA83: 26 C1      BNE  $FA46          ; 
FA85: 96 03      LDA  >$03           ; 
FA87: 26 46      BNE  $FACF          ; 
FA89: 96 15      LDA  >$15           ; 
FA8B: 27 42      BEQ  $FACF          ; 
FA8D: 7A 00 16   DEC  $0016          ; 
FA90: 27 3D      BEQ  $FACF          ; 
FA92: 9B 22      ADDA >$22           ; 
FA94: 97 22      STA  >$22           ; 
FA96: DE 1A      LDX  >$1A           ; 
FA98: 5F         CLRB                ; 
FA99: 96 22      LDA  >$22           ; 
FA9B: 7D 00 15   TST  $0015          ; 
FA9E: 2B 06      BMI  $FAA6          ; 
FAA0: AB 00      ADDA $00,X          ; 
FAA2: 25 08      BCS  $FAAC          ; 
FAA4: 20 0B      BRA  $FAB1          ; 
FAA6: AB 00      ADDA $00,X          ; 
FAA8: 27 02      BEQ  $FAAC          ; 
FAAA: 25 05      BCS  $FAB1          ; 
FAAC: 5D         TSTB                ; 
FAAD: 27 08      BEQ  $FAB7          ; 
FAAF: 20 0F      BRA  $FAC0          ; 
FAB1: 5D         TSTB                ; 
FAB2: 26 03      BNE  $FAB7          ; 
FAB4: DF 1A      STX  >$1A           ; 
FAB6: 5C         INCB                ; 
FAB7: 08         INX                 ; 
FAB8: 9C 1C      CPX  >$1C           ; 
FABA: 26 DD      BNE  $FA99          ; 
FABC: 5D         TSTB                ; 
FABD: 26 01      BNE  $FAC0          ; 
FABF: 39         RTS                 ; 
FAC0: DF 1C      STX  >$1C           ; 
FAC2: 96 14      LDA  >$14           ; 
FAC4: 27 06      BEQ  $FACC          ; 
FAC6: 8D 08      BSR  $FAD0          ; 
FAC8: 96 19      LDA  >$19           ; 
FACA: 8D 16      BSR  $FAE2          ; 
FACC: 7E FA 42   JMP  $FA42          ; 
FACF: 39         RTS                 ; 
FAD0: CE 00 23   LDX  #$0023         ; 
FAD3: DF 0E      STX  >$0E           ; 
FAD5: DE 17      LDX  >$17           ; 
FAD7: E6 00      LDB  $00,X          ; 
FAD9: 08         INX                 ; 
FADA: BD F9 65   JSR  $F965          ; 
FADD: DE 0E      LDX  >$0E           ; 
FADF: DF 1E      STX  >$1E           ; 
FAE1: 39         RTS                 ; 
FAE2: 4D         TSTA                ; 
FAE3: 27 2B      BEQ  $FB10          ; 
FAE5: DE 17      LDX  >$17           ; 
FAE7: DF 0C      STX  >$0C           ; 
FAE9: CE 00 23   LDX  #$0023         ; 
FAEC: 97 11      STA  >$11           ; 
FAEE: DF 0E      STX  >$0E           ; 
FAF0: DE 0C      LDX  >$0C           ; 
FAF2: D6 11      LDB  >$11           ; 
FAF4: D7 10      STB  >$10           ; 
FAF6: E6 01      LDB  $01,X          ; 
FAF8: 54         LSRB                ; 
FAF9: 54         LSRB                ; 
FAFA: 54         LSRB                ; 
FAFB: 54         LSRB                ; 
FAFC: 08         INX                 ; 
FAFD: DF 0C      STX  >$0C           ; 
FAFF: DE 0E      LDX  >$0E           ; 
FB01: A6 00      LDA  $00,X          ; 
FB03: 10         SBA                 ; 
FB04: 7A 00 10   DEC  $0010          ; 
FB07: 26 FA      BNE  $FB03          ; 
FB09: A7 00      STA  $00,X          ; 
FB0B: 08         INX                 ; 
FB0C: 9C 1E      CPX  >$1E           ; 
FB0E: 26 DE      BNE  $FAEE          ; 
FB10: 39         RTS                 ; 


; IRQ Handler


FB11: 8E 00 7F   LDS  #$007F         ; 
FB14: B6 04 02   LDA  $0402          ; 
FB17: CE F0 EB   LDX  #$F0EB         ; 
FB1A: DF 07      STX  >$07           ; 
FB1C: CE 00 12   LDX  #$0012         ; 
FB1F: DF 0E      STX  >$0E           ; 
FB21: C6 AF      LDB  #$AF           ; 
FB23: D7 09      STB  >$09           ; 
FB25: 0E         CLI                 ; 
FB26: 43         COMA                ; 
FB27: 84 3F      ANDA #$3F           ; 
FB29: D6 04      LDB  >$04           ; 
FB2B: 27 03      BEQ  $FB30          ; 
FB2D: BD F8 CD   JSR  $F8CD          ; 
FB30: 5F         CLRB                ; 
FB31: 81 0E      CMPA #$0E           ; 
FB33: 27 02      BEQ  $FB37          ; 
FB35: D7 02      STB  >$02           ; 
FB37: 81 12      CMPA #$12           ; 
FB39: 27 02      BEQ  $FB3D          ; 
FB3B: D7 03      STB  >$03           ; 
FB3D: 4D         TSTA                ; 
FB3E: 27 3F      BEQ  $FB7F          ; 
FB40: 4A         DECA                ; 
FB41: 81 1F      CMPA #$1F           ; 
FB43: 2D 14      BLT  $FB59          ; 
FB45: 81 3D      CMPA #$3D           ; 
FB47: 2E 08      BGT  $FB51          ; 
FB49: 81 2A      CMPA #$2A           ; 
FB4B: 22 08      BHI  $FB55          ; 
FB4D: 80 10      SUBA #$10           ; 
FB4F: 20 0C      BRA  $FB5D          ; 
FB51: 80 39      SUBA #$39           ; 
FB53: 20 24      BRA  $FB79          ; 
FB55: 80 1C      SUBA #$1C           ; 
FB57: 20 12      BRA  $FB6B          ; 
FB59: 81 0C      CMPA #$0C           ; 
FB5B: 22 08      BHI  $FB65          ; 
FB5D: BD F9 DC   JSR  $F9DC          ; 
FB60: BD FA 42   JSR  $FA42          ; 
FB63: 20 1A      BRA  $FB7F          ; 
FB65: 81 1B      CMPA #$1B           ; 
FB67: 22 0E      BHI  $FB77          ; 
FB69: 80 0D      SUBA #$0D           ; 
FB6B: 48         ASLA                ; 
FB6C: CE FB C4   LDX  #$FBC4         ; 
FB6F: 8D 21      BSR  $FB92          ; 
FB71: EE 00      LDX  $00,X          ; 
FB73: AD 00      JSR  $00,X          ; 
FB75: 20 08      BRA  $FB7F          ; 
FB77: 80 1C      SUBA #$1C           ; 
FB79: BD F4 EE   JSR  $F4EE          ; 
FB7C: BD F5 03   JSR  $F503          ; 
FB7F: 96 00      LDA  >$00           ; 
FB81: 9A 01      ORA  >$01           ; 
FB83: 27 FE      BEQ  $FB83          ; 
FB85: 4F         CLRA                ; 
FB86: 97 03      STA  >$03           ; 
FB88: 96 00      LDA  >$00           ; 
FB8A: 27 03      BEQ  $FB8F          ; 
FB8C: 7E F7 72   JMP  $F772          ; 
FB8F: 7E F9 8F   JMP  $F98F          ; 
FB92: DF 0C      STX  >$0C           ; 
FB94: 9B 0D      ADDA >$0D           ; 
FB96: 97 0D      STA  >$0D           ; 
FB98: 24 03      BCC  $FB9D          ; 
FB9A: 7C 00 0C   INC  $000C          ; 
FB9D: DE 0C      LDX  >$0C           ; 
FB9F: 39         RTS                 ; 

; Software IRQ


FBA0: 0F         SEI                 ; 
FBA1: 8E 00 7F   LDS  #$007F         ; 
FBA4: CE FF FF   LDX  #$FFFF         ; 
FBA7: 5F         CLRB                ; 
FBA8: E9 00      ADCB $00,X          ; 
FBAA: 09         DEX                 ; 
FBAB: 8C F0 00   CPX  #$F000         ; 
FBAE: 26 F8      BNE  $FBA8          ; 
FBB0: E1 00      CMPB $00,X          ; 
FBB2: 27 01      BEQ  $FBB5          ; 
FBB4: 3E         WAI                 ; 
FBB5: BD F7 A2   JSR  $F7A2          ; 
FBB8: 86 02      LDA  #$02           ; 
FBBA: BD F8 D2   JSR  $F8D2          ; 
FBBD: 86 01      LDA  #$01           ; 
FBBF: BD F8 D2   JSR  $F8D2          ; 
FBC2: 20 DC      BRA  $FBA0          ; 
FBC4: F9 A4 F7   ADCB $A4F7          ; 
FBC7: 72 
FBC8: F9 7F F5   ADCB $7FF5          ; 
FBCB: 5A         DECB                ; 
FBCC: F9 CC F9   ADCB $CCF9          ; 
FBCF: 79 F5 9B   ROL  $F59B          ; 
FBD2: F5 62 F7   BITB $62F7          ; 
FBD5: 7B 
FBD6: F7 80 F8   STB  $80F8          ; 
FBD9: 2B F8      BMI  $FBD3          ; 
FBDB: 59         ROLB                ; 
FBDC: F8 78 F8   EORB $78F8          ; 
FBDF: C9 F9      ADCB #$F9           ; 
FBE1: 0C         CLC                 ; 
FBE2: F0 FB F1   SUBB $FBF1          ; 
FBE5: 0A         CLV                 ; 
FBE6: F0 EF F2   SUBB $EFF2          ; 
FBE9: F6 F2 D1   LDB  $F2D1          ; 
FBEC: F2 D6 F2   SBCB $D6F2          ; 
FBEF: E8 F2      EORB $F2,X          ; 
FBF1: FF F3 08   STX  $F308          ; 
FBF4: F2 BB F1   SBCB $BBF1          ; 
FBF7: 28 F1      BVC  $FBEA          ; 
FBF9: 0F         SEI                 ; 
FBFA: F1 14 F5   CMPB $14F5          ; 
FBFD: 50         NEGB                ; 
FBFE: F5 E1 F2   BITB $E1F2          ; 
FC01: 18 
FC02: F1 47 F1   CMPB $47F1          ; 
FC05: A4 F7      ANDA $F7,X          ; 
FC07: A2 40      SBCA $40,X          ; 
FC09: 01         NOP                 ; 
FC0A: 00 
FC0B: 10         SBA                 ; 
FC0C: E1 00      CMPB $00,X          ; 
FC0E: 80 FF      SUBA #$FF           ; 
FC10: FF 28 01   STX  $2801          ; 
FC13: 00 
FC14: 08         INX                 ; 
FC15: 81 02      CMPA #$02           ; 
FC17: 00 
FC18: FF FF 28   STX  $FF28          ; 
FC1B: 81 00      CMPA #$00           ; 
FC1D: FC 01 02   LDD  $0102          ; 
FC20: 00 
FC21: FC FF FF   LDD  $FFFF          ; 
FC24: 01         NOP                 ; 
FC25: 00 
FC26: 18 
FC27: 41 
FC28: 04         LSRD                ; 
FC29: 80 00      SUBA #$00           ; 
FC2B: FF 00 FF   STX  $00FF          ; 
FC2E: 08         INX                 ; 
FC2F: FF 68 04   STX  $6804          ; 
FC32: 80 00      SUBA #$00           ; 
FC34: FF 28 81   STX  $2881          ; 
FC37: 00 
FC38: FC 01 02   LDD  $0102          ; 
FC3B: 00 
FC3C: FC FF 60   LDD  $FF60          ; 
FC3F: 01         NOP                 ; 
FC40: 57         ASRB                ; 
FC41: 08         INX                 ; 
FC42: E1 02      CMPB $02,X          ; 
FC44: 00 
FC45: FE 80 8C   LDX  $808C          ; 
FC48: 5B 
FC49: B6 40 BF   LDA  $40BF          ; 
FC4C: 49         ROLA                ; 
FC4D: A4 73      ANDA $73,X          ; 
FC4F: 73 A4 49   COM  $A449          ; 
FC52: BF 40 B6   STS  $40B6          ; 
FC55: 5B 
FC56: 8C 1C F8   CPX  #$1CF8         ; 
FC59: 04         LSRD                ; 
FC5A: 05 
FC5B: 55 
FC5C: 00 
FC5D: 04         LSRD                ; 
FC5E: 05 
FC5F: 55 
FC60: F8 04 05   EORB $0405          ; 
FC63: 55 
FC64: 00 
FC65: 04         LSRD                ; 
FC66: 05 
FC67: 55 
FC68: F8 04 05   EORB $0405          ; 
FC6B: 55 
FC6C: 00 
FC6D: 04         LSRD                ; 
FC6E: 05 
FC6F: 55 
FC70: F8 17 3B   EORB $173B          ; 
FC73: 41 
FC74: B0 1F 1D   SUBA $1F1D          ; 
FC77: 04         LSRD                ; 
FC78: CB 00      ADDB #$00           ; 
FC7A: 04         LSRD                ; 
FC7B: 06         TAP                 ; 
FC7C: 66 3E      ROR  $3E,X          ; 
FC7E: 1D 
FC7F: 04         LSRD                ; 
FC80: CB 00      ADDB #$00           ; 
FC82: 04         LSRD                ; 
FC83: 1F 
FC84: FE 3E 3F   LDX  $3E3F          ; 
FC87: 03 
FC88: 97 00      STA  >$00           ; 
FC8A: 04         LSRD                ; 
FC8B: 06         TAP                 ; 
FC8C: 66 7C      ROR  $7C,X          ; 
FC8E: 3F         SWI                 ; 
FC8F: 03 
FC90: 97 00      STA  >$00           ; 
FC92: 04         LSRD                ; 
FC93: 1F 
FC94: FE 7C 1D   LDX  $7C1D          ; 
FC97: 04         LSRD                ; 
FC98: CB 00      ADDB #$00           ; 
FC9A: 04         LSRD                ; 
FC9B: 06         TAP                 ; 
FC9C: 66 F8      ROR  $F8,X          ; 
FC9E: 1D 
FC9F: 04         LSRD                ; 
FCA0: CB 00      ADDB #$00           ; 
FCA2: 04         LSRD                ; 
FCA3: 06         TAP                 ; 
FCA4: 66 7C      ROR  $7C,X          ; 
FCA6: 3F         SWI                 ; 
FCA7: 03 
FCA8: 97 00      STA  >$00           ; 
FCAA: 04         LSRD                ; 
FCAB: 06         TAP                 ; 
FCAC: 66 F8      ROR  $F8,X          ; 
FCAE: 3F         SWI                 ; 
FCAF: 03 
FCB0: 97 00      STA  >$00           ; 
FCB2: 04         LSRD                ; 
FCB3: 2C CA      BGE  $FC7F          ; 
FCB5: 7C 3F 03   INC  $3F03          ; 
FCB8: 97 7C      STA  >$7C           ; 
FCBA: 1D 
FCBB: 04         LSRD                ; 
FCBC: CB 7C      ADDB #$7C           ; 
FCBE: 12 
FCBF: 05 
FCC0: 61 
FCC1: 7C 0D 05   INC  $0D05          ; 
FCC4: B3 7C 12   SUBD $7C12          ; 
FCC7: 05 
FCC8: 61 
FCC9: 7C 0D 05   INC  $0D05          ; 
FCCC: B3 7C 04   SUBD $7C04          ; 
FCCF: 06         TAP                 ; 
FCD0: 66 7C      ROR  $7C,X          ; 
FCD2: 0D         SEC                 ; 
FCD3: 05 
FCD4: B3 7C 12   SUBD $7C12          ; 
FCD7: 05 
FCD8: 61 
FCD9: 7C 1D 04   INC  $1D04          ; 
FCDC: CB 3E      ADDB #$3E           ; 
FCDE: 37         PSHB                ; 
FCDF: 03 
FCE0: CE 3E 3F   LDX  #$3E3F         ; 
FCE3: 03 
FCE4: 97 7C      STA  >$7C           ; 
FCE6: 04         LSRD                ; 
FCE7: 06         TAP                 ; 
FCE8: 66 7C      ROR  $7C,X          ; 
FCEA: 0D         SEC                 ; 
FCEB: 05 
FCEC: B3 7C 12   SUBD $7C12          ; 
FCEF: 05 
FCF0: 61 
FCF1: 7C 1D 04   INC  $1D04          ; 
FCF4: CB 7C      ADDB #$7C           ; 
FCF6: 23 04      BLS  $FCFC          ; 
FCF8: 86 7C      LDA  #$7C           ; 
FCFA: 1D 
FCFB: 04         LSRD                ; 
FCFC: CB 7C      ADDB #$7C           ; 
FCFE: 12 
FCFF: 05 
FD00: 61 
FD01: 3E         WAI                 ; 
FD02: 1D 
FD03: 04         LSRD                ; 
FD04: CB 00      ADDB #$00           ; 
FD06: 04         LSRD                ; 
FD07: 06         TAP                 ; 
FD08: 66 7C      ROR  $7C,X          ; 
FD0A: 1D 
FD0B: 04         LSRD                ; 
FD0C: CB 00      ADDB #$00           ; 
FD0E: 04         LSRD                ; 
FD0F: 06         TAP                 ; 
FD10: 66 3E      ROR  $3E,X          ; 
FD12: 3F         SWI                 ; 
FD13: 03 
FD14: 97 00      STA  >$00           ; 
FD16: 04         LSRD                ; 
FD17: 06         TAP                 ; 
FD18: 66 7C      ROR  $7C,X          ; 
FD1A: 3F         SWI                 ; 
FD1B: 03 
FD1C: 97 00      STA  >$00           ; 
FD1E: 04         LSRD                ; 
FD1F: 1F 
FD20: FE F8 1D   LDX  $F81D          ; 
FD23: 2F EE      BLE  $FD13          ; 
FD25: 00 
FD26: 47         ASRA                ; 
FD27: 3F         SWI                 ; 
FD28: 37         PSHB                ; 
FD29: 30         TSX                 ; 
FD2A: 29 23      BVS  $FD4F          ; 
FD2C: 1D 
FD2D: 17         TBA                 ; 
FD2E: 12 
FD2F: 0D         SEC                 ; 
FD30: 08         INX                 ; 
FD31: 04         LSRD                ; 
FD32: 08         INX                 ; 
FD33: 7F D9 FF   CLR  $D9FF          ; 
FD36: D9 7F      ADCB >$7F           ; 
FD38: 24 00      BCC  $FD3A          ; 
FD3A: 24 08      BCC  $FD44          ; 
FD3C: 00 
FD3D: 40         NEGA                ; 
FD3E: 80 00      SUBA #$00           ; 
FD40: FF 00 80   STX  $0080          ; 
FD43: 40         NEGA                ; 
FD44: 10         SBA                 ; 
FD45: 7F B0 D9   CLR  $B0D9          ; 
FD48: F5 FF F5   BITB $FFF5          ; 
FD4B: D9 B0      ADCB >$B0           ; 
FD4D: 7F 4E 24   CLR  $4E24          ; 
FD50: 09         DEX                 ; 
FD51: 00 
FD52: 09         DEX                 ; 
FD53: 24 4E      BCC  $FDA3          ; 
FD55: 10         SBA                 ; 
FD56: 7F C5 EC   CLR  $C5EC          ; 
FD59: E7 BF      STB  $BF,X          ; 
FD5B: 8D 6D      BSR  $FDCA          ; 
FD5D: 6A 7F      DEC  $7F,X          ; 
FD5F: 94 92      ANDA >$92           ; 
FD61: 71 
FD62: 40         NEGA                ; 
FD63: 17         TBA                 ; 
FD64: 12 
FD65: 39         RTS                 ; 
FD66: 10         SBA                 ; 
FD67: FF FF FF   STX  $FFFF          ; 
FD6A: FF 00 00   STX  $0000          ; 
FD6D: 00 
FD6E: 00 
FD6F: FF FF FF   STX  $FFFF          ; 
FD72: FF 00 00   STX  $0000          ; 
FD75: 00 
FD76: 00 
FD77: 48         ASLA                ; 
FD78: 8A 95      ORA  #$95           ; 
FD7A: A0 AB      SUBA $AB,X          ; 
FD7C: B5 BF C8   BITA $BFC8          ; 
FD7F: D1 DA      CMPB >$DA           ; 
FD81: E1 E8      CMPB $E8,X          ; 
FD83: EE F3      LDX  $F3,X          ; 
FD85: F7 FB FD   STB  $FBFD          ; 
FD88: FE FF FE   LDX  $FFFE          ; 
STD  m
{BASE_ADDRESS_BYTE_DATA=FB}
ADDRESS_WORD_TEXT
[253, 251]
FD8B: FD FB      STD  $0000          ; 
FD8D: F7 F3 EE   STB  $F3EE          ; 
FD90: E8 E1      EORB $E1,X          ; 
FD92: DA D1      ORB  >$D1           ; 
FD94: C8 BF      EORB #$BF           ; 
FD96: B5 AB A0   BITA $ABA0          ; 
FD99: 95 8A      BITA >$8A           ; 
FD9B: 7F 75 6A   CLR  $756A          ; 
FD9E: 5F         CLRB                ; 
FD9F: 54         LSRB                ; 
FDA0: 4A         DECA                ; 
FDA1: 40         NEGA                ; 
FDA2: 37         PSHB                ; 
FDA3: 2E 25      BGT  $FDCA          ; 
FDA5: 1E 
FDA6: 17         TBA                 ; 
FDA7: 11         CBA                 ; 
FDA8: 0C         CLC                 ; 
FDA9: 08         INX                 ; 
FDAA: 04         LSRD                ; 
FDAB: 02 
FDAC: 01         NOP                 ; 
FDAD: 00 
FDAE: 01         NOP                 ; 
FDAF: 02 
FDB0: 04         LSRD                ; 
FDB1: 08         INX                 ; 
FDB2: 0C         CLC                 ; 
FDB3: 11         CBA                 ; 
FDB4: 17         TBA                 ; 
FDB5: 1E 
FDB6: 25 2E      BCS  $FDE6          ; 
FDB8: 37         PSHB                ; 
FDB9: 40         NEGA                ; 
FDBA: 4A         DECA                ; 
FDBB: 54         LSRB                ; 
FDBC: 5F         CLRB                ; 
FDBD: 6A 75      DEC  $75,X          ; 
FDBF: 7F 10 59   CLR  $1059          ; 
FDC2: 7B 
FDC3: 98 AC      EORA >$AC           ; 
FDC5: B3 AC 98   SUBD $AC98          ; 
FDC8: 7B 
FDC9: 59         ROLB                ; 
FDCA: 37         PSHB                ; 
FDCB: 19         DAA                 ; 
FDCC: 06         TAP                 ; 
FDCD: 00 
FDCE: 06         TAP                 ; 
FDCF: 19         DAA                 ; 
FDD0: 37         PSHB                ; 
FDD1: 08         INX                 ; 
FDD2: FF FF FF   STX  $FFFF          ; 
FDD5: FF 00 00   STX  $0000          ; 
FDD8: 00 
FDD9: 00 
FDDA: 10         SBA                 ; 
FDDB: 76 FF B8   ROR  $FFB8          ; 
FDDE: D0 9D      SUBB >$9D           ; 
FDE0: E6 6A      LDB  $6A,X          ; 
FDE2: 82 76      SBCA #$76           ; 
FDE4: EA 81      ORB  $81,X          ; 
FDE6: 86 4E      LDA  #$4E           ; 
FDE8: 9C 32      CPX  >$32           ; 
FDEA: 63 10      COM  $10,X          ; 
FDEC: 00 
FDED: F4 00 E8   ANDB $00E8          ; 
FDF0: 00 
FDF1: DC 00      LDD  >$00           ; 
FDF3: E2 00      SBCB $00,X          ; 
FDF5: DC 00      LDD  >$00           ; 
FDF7: E8 00      EORB $00,X          ; 
FDF9: F4 00 00   ANDB $0000          ; 
FDFC: 48         ASLA                ; 
FDFD: 45 
FDFE: 4B 
FDFF: 50         NEGB                ; 
FE00: 56         RORB                ; 
FE01: 5B 
FE02: 60 64      NEG  $64,X          ; 
FE04: 69 6D      ROL  $6D,X          ; 
FE06: 71 
FE07: 74 77 7A   LSR  $777A          ; 
FE0A: 7C 7E 7F   INC  $7E7F          ; 
FE0D: 7F 80 7F   CLR  $807F          ; 
FE10: 7F 7E 7C   CLR  $7E7C          ; 
FE13: 7A 77 74   DEC  $7774          ; 
FE16: 71 
FE17: 6D 69      TST  $69,X          ; 
FE19: 64 60      LSR  $60,X          ; 
FE1B: 5B 
FE1C: 56         RORB                ; 
FE1D: 50         NEGB                ; 
FE1E: 4B 
FE1F: 45 
FE20: 40         NEGA                ; 
FE21: 3B         RTI                 ; 
FE22: 35         TXS                 ; 
FE23: 30         TSX                 ; 
FE24: 2A 25      BPL  $FE4B          ; 
FE26: 20 1C      BRA  $FE44          ; 
FE28: 17         TBA                 ; 
FE29: 13 
FE2A: 0F         SEI                 ; 
FE2B: 0C         CLC                 ; 
FE2C: 09         DEX                 ; 
FE2D: 06         TAP                 ; 
FE2E: 04         LSRD                ; 
FE2F: 02 
FE30: 01         NOP                 ; 
FE31: 01         NOP                 ; 
FE32: 00 
FE33: 01         NOP                 ; 
FE34: 01         NOP                 ; 
FE35: 02 
FE36: 04         LSRD                ; 
FE37: 06         TAP                 ; 
FE38: 09         DEX                 ; 
FE39: 0C         CLC                 ; 
FE3A: 0F         SEI                 ; 
FE3B: 13 
FE3C: 17         TBA                 ; 
FE3D: 1C 
FE3E: 20 25      BRA  $FE65          ; 
FE40: 2A 30      BPL  $FE72          ; 
FE42: 35         TXS                 ; 
FE43: 3B         RTI                 ; 
FE44: 40         NEGA                ; 
FE45: 81 24      CMPA #$24           ; 
FE47: 00 
FE48: 00 
FE49: 00 
FE4A: 16         TAB                 ; 
FE4B: 31         INS                 ; 
FE4C: 12 
FE4D: 05 
FE4E: 1A 
FE4F: FF 00 27   STX  $0027          ; 
FE52: 6D 11      TST  $11,X          ; 
FE54: 05 
FE55: 11         CBA                 ; 
FE56: 01         NOP                 ; 
FE57: 0F         SEI                 ; 
FE58: 01         NOP                 ; 
FE59: 47         ASRA                ; 
FE5A: 11         CBA                 ; 
FE5B: 31         INS                 ; 
FE5C: 00 
FE5D: 01         NOP                 ; 
FE5E: 00 
FE5F: 0D         SEC                 ; 
FE60: 1B         ABA                 ; 
FE61: F4 12 00   ANDB $1200          ; 
FE64: 00 
FE65: 00 
FE66: 14 
FE67: 47         ASRA                ; 
FE68: 41 
FE69: 45 
FE6A: 00 
FE6B: 00 
FE6C: 00 
FE6D: 0F         SEI                 ; 
FE6E: 5B 
FE6F: 21 35      BRN  $FEA6          ; 
FE71: 11         CBA                 ; 
FE72: FF 00 0D   STX  $000D          ; 
FE75: 1B         ABA                 ; 
FE76: 15 
FE77: 00 
FE78: 00 
STD  m
{BASE_ADDRESS_BYTE_DATA=00}
ADDRESS_WORD_TEXT
[253, 0]
FE79: FD 00      STD  $0000          ; 
FE7B: 01         NOP                 ; 
FE7C: 69 31      ROL  $31,X          ; 
FE7E: 11         CBA                 ; 
FE7F: 00 
FE80: 01         NOP                 ; 
FE81: 00 
FE82: 03 
FE83: 6A 01      DEC  $01,X          ; 
FE85: 15 
FE86: 01         NOP                 ; 
FE87: 01         NOP                 ; 
FE88: 01         NOP                 ; 
FE89: 01         NOP                 ; 
FE8A: 47         ASRA                ; 
FE8B: F6 53 03   LDB  $5303          ; 
FE8E: 00 
FE8F: 02 
FE90: 06         TAP                 ; 
FE91: 94 6A      ANDA >$6A           ; 
FE93: 10         SBA                 ; 
FE94: 02 
FE95: 00 
FE96: 02 
FE97: 06         TAP                 ; 
FE98: 9A 1F      ORA  >$1F           ; 
FE9A: 12 
FE9B: 00 
FE9C: FF 10 04   STX  $1004          ; 
FE9F: 69 31      ROL  $31,X          ; 
FEA1: 11         CBA                 ; 
FEA2: 00 
FEA3: FF 00 0D   STX  $000D          ; 
FEA6: 00 
FEA7: 12 
FEA8: 06         TAP                 ; 
FEA9: 00 
FEAA: FF 01 09   STX  $0109          ; 
FEAD: 28 14      BVC  $FEC3          ; 
FEAF: 17         TBA                 ; 
FEB0: 00 
FEB1: 00 
FEB2: 00 
FEB3: 0E         CLI                 ; 
FEB4: 0D         SEC                 ; 
FEB5: F4 11 00   ANDB $1100          ; 
FEB8: 00 
FEB9: 00 
FEBA: 0E         CLI                 ; 
FEBB: 0D         SEC                 ; 
FEBC: 21 30      BRN  $FEEE          ; 
FEBE: 00 
FEBF: 01         NOP                 ; 
FEC0: 00 
FEC1: 0D         SEC                 ; 
FEC2: 1B         ABA                 ; 
FEC3: 13 
FEC4: 10         SBA                 ; 
FEC5: 00 
FEC6: FF 00 09   STX  $0009          ; 
FEC9: A4 F4      ANDA $F4,X          ; 
FECB: 18 
FECC: 00 
FECD: 00 
FECE: 00 
FECF: 12 
FED0: B3 82 22   SUBD $8222          ; 
FED3: 00 
FED4: 00 
FED5: 00 
FED6: 18 
FED7: C6 F2      LDB  #$F2           ; 
FED9: 19         DAA                 ; 
FEDA: 00 
FEDB: 00 
FEDC: 00 
FEDD: 16         TAB                 ; 
FEDE: DF 21      STX  >$21           ; 
FEE0: 30         TSX                 ; 
FEE1: 00 
FEE2: FF 00 1B   STX  $001B          ; 
FEE5: 0D         SEC                 ; 
FEE6: F1 19 00   CMPB $1900          ; 
FEE9: 00 
FEEA: 00 
FEEB: 0E         CLI                 ; 
FEEC: A4 31      ANDA $31,X          ; 
FEEE: 19         DAA                 ; 
FEEF: 00 
FEF0: 01         NOP                 ; 
FEF1: 00 
FEF2: 03 
FEF3: 6A 41      DEC  $41,X          ; 
FEF5: 02 
FEF6: D0 00      SUBB >$00           ; 
FEF8: 00 
FEF9: 27 6D      BEQ  $FF68          ; 
FEFB: 03 
FEFC: 15 
FEFD: 11         CBA                 ; 
FEFE: FF 00 0D   STX  $000D          ; 
FF01: 1B         ABA                 ; 
FF02: A0 98      SUBA $98,X          ; 
FF04: 90 88      SUBA >$88           ; 
FF06: 80 78      SUBA #$78           ; 
FF08: 70 68 60   NEG  $6860          ; 
FF0B: 58         ASLB                ; 
FF0C: 50         NEGB                ; 
FF0D: 44         LSRA                ; 
FF0E: 40         NEGA                ; 
FF0F: 01         NOP                 ; 
FF10: 01         NOP                 ; 
FF11: 02 
FF12: 02 
FF13: 04         LSRD                ; 
FF14: 04         LSRD                ; 
FF15: 08         INX                 ; 
FF16: 08         INX                 ; 
FF17: 10         SBA                 ; 
FF18: 10         SBA                 ; 
FF19: 30         TSX                 ; 
FF1A: 60 C0      NEG  $C0,X          ; 
FF1C: E0 01      SUBB $01,X          ; 
FF1E: 01         NOP                 ; 
FF1F: 02 
FF20: 02 
FF21: 03 
FF22: 04         LSRD                ; 
FF23: 05 
FF24: 06         TAP                 ; 
FF25: 07         TPA                 ; 
FF26: 08         INX                 ; 
FF27: 09         DEX                 ; 
FF28: 0A         CLV                 ; 
FF29: 0C         CLC                 ; 
FF2A: 80 7C      SUBA #$7C           ; 
FF2C: 78 74 70   ASL  $7470          ; 
FF2F: 74 78 7C   LSR  $787C          ; 
FF32: 80 01      SUBA #$01           ; 
FF34: 01         NOP                 ; 
FF35: 02 
FF36: 02 
FF37: 04         LSRD                ; 
FF38: 04         LSRD                ; 
FF39: 08         INX                 ; 
FF3A: 08         INX                 ; 
FF3B: 10         SBA                 ; 
FF3C: 20 28      BRA  $FF66          ; 
FF3E: 30         TSX                 ; 
FF3F: 38         PULX                ; 
FF40: 40         NEGA                ; 
FF41: 48         ASLA                ; 
FF42: 50         NEGB                ; 
FF43: 60 70      NEG  $70,X          ; 
FF45: 80 A0      SUBA #$A0           ; 
FF47: B0 C0 08   SUBA $C008          ; 
FF4A: 40         NEGA                ; 
FF4B: 08         INX                 ; 
FF4C: 40         NEGA                ; 
FF4D: 08         INX                 ; 
FF4E: 40         NEGA                ; 
FF4F: 08         INX                 ; 
FF50: 40         NEGA                ; 
FF51: 08         INX                 ; 
FF52: 40         NEGA                ; 
FF53: 08         INX                 ; 
FF54: 40         NEGA                ; 
FF55: 08         INX                 ; 
FF56: 40         NEGA                ; 
FF57: 08         INX                 ; 
FF58: 40         NEGA                ; 
FF59: 08         INX                 ; 
FF5A: 40         NEGA                ; 
FF5B: 08         INX                 ; 
FF5C: 40         NEGA                ; 
FF5D: 01         NOP                 ; 
FF5E: 02 
FF5F: 04         LSRD                ; 
FF60: 08         INX                 ; 
FF61: 09         DEX                 ; 
FF62: 0A         CLV                 ; 
FF63: 0B         SEV                 ; 
FF64: 0C         CLC                 ; 
FF65: 0E         CLI                 ; 
FF66: 0F         SEI                 ; 
FF67: 10         SBA                 ; 
FF68: 12 
FF69: 14 
FF6A: 16         TAB                 ; 
FF6B: 40         NEGA                ; 
FF6C: 10         SBA                 ; 
FF6D: 08         INX                 ; 
FF6E: 01         NOP                 ; 
FF6F: 01         NOP                 ; 
FF70: 01         NOP                 ; 
FF71: 01         NOP                 ; 
FF72: 01         NOP                 ; 
FF73: 02 
FF74: 02 
FF75: 03 
FF76: 03 
FF77: 04         LSRD                ; 
FF78: 04         LSRD                ; 
FF79: 05 
FF7A: 06         TAP                 ; 
FF7B: 08         INX                 ; 
FF7C: 0A         CLV                 ; 
FF7D: 0C         CLC                 ; 
FF7E: 10         SBA                 ; 
FF7F: 14 
FF80: 18 
FF81: 20 30      BRA  $FFB3          ; 
FF83: 40         NEGA                ; 
FF84: 50         NEGB                ; 
FF85: 40         NEGA                ; 
FF86: 30         TSX                 ; 
FF87: 20 10      BRA  $FF99          ; 
FF89: 0C         CLC                 ; 
FF8A: 0A         CLV                 ; 
FF8B: 08         INX                 ; 
FF8C: 07         TPA                 ; 
FF8D: 06         TAP                 ; 
FF8E: 05 
FF8F: 04         LSRD                ; 
FF90: 03 
FF91: 02 
FF92: 02 
FF93: 01         NOP                 ; 
FF94: 01         NOP                 ; 
FF95: 01         NOP                 ; 
FF96: 07         TPA                 ; 
FF97: 08         INX                 ; 
FF98: 09         DEX                 ; 
FF99: 0A         CLV                 ; 
FF9A: 0C         CLC                 ; 
FF9B: 08         INX                 ; 
FF9C: 17         TBA                 ; 
FF9D: 18 
FF9E: 19         DAA                 ; 
FF9F: 1A 
FFA0: 1B         ABA                 ; 
FFA1: 1C 
FFA2: 00 
FFA3: 00 
FFA4: 00 
FFA5: 00 
FFA6: 08         INX                 ; 
FFA7: 80 10      SUBA #$10           ; 
FFA9: 78 18 70   ASL  $1870          ; 
FFAC: 20 60      BRA  $1000E         ; 
FFAE: 28 58      BVC  $10008         ; 
FFB0: 30         TSX                 ; 
FFB1: 50         NEGB                ; 
FFB2: 40         NEGA                ; 
FFB3: 48         ASLA                ; 
FFB4: 00 
FFB5: 01         NOP                 ; 
FFB6: 08         INX                 ; 
FFB7: 10         SBA                 ; 
FFB8: 01         NOP                 ; 
FFB9: 08         INX                 ; 
FFBA: 10         SBA                 ; 
FFBB: 01         NOP                 ; 
FFBC: 08         INX                 ; 
FFBD: 10         SBA                 ; 
FFBE: 01         NOP                 ; 
FFBF: 08         INX                 ; 
FFC0: 10         SBA                 ; 
FFC1: 01         NOP                 ; 
FFC2: 08         INX                 ; 
FFC3: 10         SBA                 ; 
FFC4: 01         NOP                 ; 
FFC5: 08         INX                 ; 
FFC6: 10         SBA                 ; 
FFC7: 00 
FFC8: 10         SBA                 ; 
FFC9: 20 40      BRA  $1000B         ; 
FFCB: 10         SBA                 ; 
FFCC: 20 40      BRA  $1000E         ; 
FFCE: 10         SBA                 ; 
FFCF: 20 40      BRA  $10011         ; 
FFD1: 10         SBA                 ; 
FFD2: 20 40      BRA  $10014         ; 
FFD4: 10         SBA                 ; 
FFD5: 20 40      BRA  $10017         ; 
FFD7: 10         SBA                 ; 
FFD8: 20 40      BRA  $1001A         ; 
FFDA: 10         SBA                 ; 
FFDB: 20 40      BRA  $1001D         ; 
FFDD: 10         SBA                 ; 
FFDE: 20 40      BRA  $10020         ; 
FFE0: 00 
FFE1: 01         NOP                 ; 
FFE2: 40         NEGA                ; 
FFE3: 02 
FFE4: 42 
FFE5: 03 
FFE6: 43         COMA                ; 
FFE7: 04         LSRD                ; 
FFE8: 44         LSRA                ; 
FFE9: 05 
FFEA: 45 
FFEB: 06         TAP                 ; 
FFEC: 46         RORA                ; 
FFED: 07         TPA                 ; 
FFEE: 47         ASRA                ; 
FFEF: 08         INX                 ; 
FFF0: 48         ASLA                ; 
FFF1: 09         DEX                 ; 
FFF2: 49         ROLA                ; 
FFF3: 0A         CLV                 ; 
FFF4: 4A         DECA                ; 
FFF5: 0B         SEV                 ; 
FFF6: 4B 
FFF7: 00
 
FFF8: FB 11  ; IRQ 
FFFA: F0 1D  ; NMI
FFFC: FB A0  ; Software IRQ
FFFE: F0 1D  ; RESET

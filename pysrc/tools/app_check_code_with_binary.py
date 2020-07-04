from tools import binary

src = '../../content/CoCo/MegaBug/Code.md'
bin = '../../content/CoCo/MegaBug/MegaBug.bin'
org = 0xC000
binary.compare_source_to_binary(src, bin, org)

src = '../../content/CoCo/RaakaTu/Code.md'
bin = '../../content/CoCo/RaakaTu/RaakaTu.bin'
org = 0x0600
binary.compare_source_to_binary(src, bin, org)

src = '../../content/TRS80/RaakaTu/Code.md'
bin = '../../content/TRS80/RaakaTu/RAAKA.bin'
org = 0x4300
binary.compare_source_to_binary(src, bin, org)


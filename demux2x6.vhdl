library ieee;
use ieee.std_logic_1164.all;

entity demux2x6 is
    port(
        -- alterados os tipos para "std_logic_vector" para aceitarem
        -- o input "XXXXXX", pois o tipo bit_vector não aceita este input.

        -- alterado o tipo bit (sel) p/ "std_logic" para ser compatível com std_logic_vector nas operações da arquitetura

        z   : in  std_logic_vector(5 downto 0);
        sel : in  std_logic;
        d0  : out std_logic_vector(5 downto 0);
        d1  : out std_logic_vector(5 downto 0)
    );
end entity;

architecture a_demux2x6 of demux2x6 is
begin
    -- XXXXXX quer dizer que a saída não importa
    -- (também pode significar que atingiu o status ERROR)

    d0 <= z when sel = '0' else "000000";
    d1 <= z when sel = '1' else "XXXXXX";
end architecture;

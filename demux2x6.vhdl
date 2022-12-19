library ieee;
use ieee.std_logic_1164.all;

entity demux2x6 is
    port(
        z   : in  std_logic_vector(5 downto 0);
        sel : in  std_logic;
        d0  : out std_logic_vector(5 downto 0);
        d1  : out std_logic_vector(5 downto 0)
    );
end entity;

architecture comp of demux2x6 is
begin
    d0 <= z when sel = '0' else "000000";
    d1 <= z when sel = '1' else "000000";
end architecture;

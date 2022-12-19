library ieee;
use ieee.std_logic_1164.all;

entity mux2x6 is
    port(
        c0  : in  std_logic_vector(5 downto 0);
        c1  : in  std_logic_vector(5 downto 0);
        sel : in  std_logic;
        z   : out std_logic_vector(5 downto 0)
    );
end entity;

architecture comp of mux2x6 is
begin
    z <= c0 when sel = '0' else c1;
end architecture;

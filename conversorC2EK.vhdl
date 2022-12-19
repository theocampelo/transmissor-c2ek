library ieee;
use ieee.std_logic_1164.all;

entity conversorC2EK is
    port(
        b   : in  std_logic_vector(4 downto 0);
        e   : out std_logic_vector(4 downto 0);
        err : out std_logic
    );
end entity;

architecture a_conversorC2EK of conversorC2EK is
begin
    e(4) <= not b(4) and (b(3) or b(2) or b(1) or b(0));
    e(3) <= (b(3) and (b(2) or b(1) or b(0))) or (not b(3) and not b(2) and not b(1) and not b(0));
    e(2) <= (b(2) and b(1)) or (b(2) and b(0)) or (not b(2) and not b(1) and not b(0));
    e(1) <= b(1) xnor b(0);
    e(0) <= not b(0);
    err  <= b(4) and not b(3) and not b(2) and not b(1) and not b(0);
end architecture;

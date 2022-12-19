library ieee;
use ieee.std_logic_1164.all;

entity tb_conversor is
end entity;

architecture test of tb_conversor is
    
    component mux2x6 is
        port(
            c0  : in std_logic_vector(5 downto 0);
            c1  : in std_logic_vector(5 downto 0);
            sel : in std_logic;
            z : out std_logic_vector(5 downto 0)
        );
    end component;

    component demux2x6 is
        port(
            z   : in std_logic_vector(5 downto 0);
            sel : in std_logic;
            d0  : out std_logic_vector(5 downto 0);
            d1  : out std_logic_vector(5 downto 0)
        );
    end component;

    component conversor is
        port(
            b   : in  std_logic_vector(4 downto 0);
            e   : out std_logic_vector(4 downto 0);
            err : out std_logic
        );
    end component;

    -- sinais para o muxdmux2x6     (5 std_logics c2/ek + 1 std_logic error)
    signal s_c0, s_c1, s_z, s_d0, s_d1 : std_logic_vector(5 downto 0);
    
    -- sinais para o conversor
    signal s_b, s_e : std_logic_vector(4 downto 0);
    signal s_sel, s_err : std_logic;

begin 

    -- mapeamento/conexões das portas
    u_mux2x6: mux2x6
    port map(s_c0, s_c1, s_sel, s_z);
    
    u_demux2x6: demux2x6
    port map(s_z, s_sel, s_d0, s_d1);
    
    u_conversor: conversor
    port map(s_b, s_e, s_err);

    s_c0(4 downto 0) <= s_b;    -- std_logics bin c2
    s_c0(5) <= '0';             -- std_logic error

    s_c1(4 downto 0) <= s_e;    -- std_logics ek
    s_c1(5) <= s_err;           -- std_logic error

    -- testes (envio dos sinais às portas)
    u_teste : process
    begin
  
        -- Conversão 00000c2 para 01111ek
        s_b   <= "00000";
        s_sel <= '1';
        wait for 10 ns;
        s_sel <= '0';
        wait for 10 ns;

        -- Vide PDF E02P03 (pg.2/3) para os seguintes exemplos:
        -- Exemplo 1: 00100 (4 dec C2) -> 10011 (-13 dec EK)
        s_b   <= "00100";
        s_sel <= '1';
        wait for 10 ns;
        s_sel <= '0';
        wait for 10 ns;

        -- Exemplo 2: ERRO
        s_b   <= "10000";
        s_sel <= '1';
        wait for 10 ns;
        s_sel <= '0';
        wait for 10 ns;

        wait;
    
    end process;

end architecture;










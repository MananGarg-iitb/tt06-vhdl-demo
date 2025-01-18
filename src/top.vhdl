library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tt_um_full_adder is
    port (
        ui_in   : in  std_logic_vector(7 downto 0);
        uo_out  : out std_logic_vector(7 downto 0);
        uio_in  : in  std_logic_vector(7 downto 0);
        uio_out : out std_logic_vector(7 downto 0);
        uio_oe  : out std_logic_vector(7 downto 0);
        ena     : in  std_logic;
        clk     : in  std_logic;
        rst_n   : in  std_logic
    );
end tt_um_full_adder;

architecture Behavioral of tt_um_full_adder is
    signal temp : std_logic_vector(15 downto 0);
begin

    assign uo_out(7) <= (ui_in(7) xor ui_in(6)) xor ui_in(5);
    assign uo_out(6) <= ((ui_in(7) and ui_in(6)) or (ui_in(6) and ui_in(5))) or (ui_in(7) and ui_in(5));

    assign uo_out(5 downto 0) <= "000000";
    assign uio_out(7 downto 0) <= "00000000";
    assign uio_oe(7 downto 0) <= "00000000";

    assign temp <= ui_in(4 downto 0) & uio_in & ena & clk & rst_n ;
end Behavioral;

library IEEE;
use IEEE.std_logic_1164.all;


entity EX_2 is
port ( X,CLK,RESET : in std_logic;
Y : out std_logic_vector(1 downto 0);
Z1,Z2 : out std_logic);
end EX_2;


architecture EX_2 of EX_2 is
type state_type is (ST0,ST1,ST2,ST3);
signal PS,NS : state_type;

begin
sync_proc: process(CLK,NS,RESET)

begin
if (RESET = '1') then PS <= ST0;
elsif (rising_edge(CLK)) then PS <= NS;
end if;
end process sync_proc;

comb_proc: process(PS,X)

begin
Z1 <= '0'; Z2 <= '0'; 
case PS is
when ST0 => Z1 <= '0'; 
if (X = '0') then NS <= ST0; Z2 <= '0';
end if;
when ST1 =>Z1 <= '0'; 
if (X = '0') then NS <= ST0; Z2 <= '0';
else NS <= ST2; Z2 <= '1';
end if;
when ST2 => Z1 <= '0'; 
if (X = '0') then NS <= ST0; Z2 <= '0';
else NS <= ST2; Z2 <= '1';
end if;
when others => Z1 <= '0'; Z2 <= '0'; NS <= ST0;
end case;
end process comb_proc;

end EX_2;
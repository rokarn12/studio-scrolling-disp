----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/29/2020 12:36:42 AM
-- Design Name: 
-- Module Name: toplevel - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity toplevel is
    PORT (
        -- Inputs
        clk : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        load : IN STD_LOGIC;
        init_value : IN STD_LOGIC_VECTOR(3 downto 0);
        clear : IN STD_LOGIC;
        
        -- Outputs
        seg : OUT STD_LOGIC_VECTOR(6 downto 0);
        an : OUT STD_LOGIC_VECTOR(3 downto 0));
end toplevel;

architecture Behavioral of toplevel is

COMPONENT clock_divider
    PORT (
        clk : IN STD_LOGIC;
        message_clk : OUT STD_LOGIC);
END COMPONENT;

COMPONENT counter_4bit
    PORT (
    ctr_clk : IN STD_LOGIC;
    enable, clear_n, load_n : IN STD_LOGIC;
    initial_value : IN STD_LOGIC_VECTOR(3 downto 0);
    
    counter_output : OUT STD_LOGIC_VECTOR(3 downto 0));
END COMPONENT;

COMPONENT Display_driver
    PORT (
        inputs : in  STD_LOGIC_VECTOR (3 downto 0);
        seg_out : out  STD_LOGIC_VECTOR (6 downto 0));
END COMPONENT;

COMPONENT Display_driver_2
    PORT ( 
        inputs : in  STD_LOGIC_VECTOR (3 downto 0);
        seg_out : out  STD_LOGIC_VECTOR (6 downto 0));
END COMPONENT;

COMPONENT Display_driver3
    PORT ( 
        inputs : in  STD_LOGIC_VECTOR (3 downto 0);
        seg_out : out  STD_LOGIC_VECTOR (6 downto 0));
END COMPONENT;

COMPONENT Display_driver_4
    PORT ( 
        inputs : in  STD_LOGIC_VECTOR (3 downto 0);
        seg_out : out  STD_LOGIC_VECTOR (6 downto 0));
END COMPONENT;

COMPONENT LEDdisplay
	PORT (
      clk                    : IN  STD_LOGIC;
      seg0,seg1,seg2,seg3        : IN  STD_LOGIC_VECTOR(6 downto 0);
      segments               : OUT  STD_LOGIC_VECTOR(6 downto 0);
      anodes                    : OUT STD_LOGIC_VECTOR(3 downto 0));
END COMPONENT;

SIGNAL m_clk : STD_LOGIC;
SIGNAL cnt_out : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL sig_segments0 : STD_LOGIC_VECTOR(6 downto 0);
SIGNAL sig_segments1 : STD_LOGIC_VECTOR(6 downto 0);
SIGNAL sig_segments2 : STD_LOGIC_VECTOR(6 downto 0);
SIGNAL sig_segments3 : STD_LOGIC_VECTOR(6 downto 0);

begin

    clk_div : clock_divider
        PORT MAP (
            clk => clk,
            message_clk => m_clk);
        
    cntr : counter_4bit
        PORT MAP (
            ctr_clk => m_clk,
            enable => '1',
            load_n => load,
            initial_value => "0000",
            clear_n => clear,
            counter_output => cnt_out);
            
    disp1 : Display_driver
        PORT MAP (
            inputs => cnt_out,
            seg_out => sig_segments0);
            
    disp2 : Display_driver_2
        PORT MAP (
            inputs => cnt_out,
            seg_out => sig_segments1);
        
    disp3 : Display_driver3
        PORT MAP (
            inputs => cnt_out,
            seg_out => sig_segments2);
            
    disp4 : Display_driver_4
        PORT MAP (
            inputs => cnt_out,
            seg_out => sig_segments3);
            
    led_disp : LEDdisplay
        PORT MAP (
            clk => clk,
            seg0 => sig_segments0,
            seg1 => sig_segments1,
            seg2 => sig_segments2,
            seg3 => sig_segments3,
            segments => seg,
            anodes => an);

end Behavioral;

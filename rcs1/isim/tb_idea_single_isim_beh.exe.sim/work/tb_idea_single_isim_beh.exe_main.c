/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_3499444699;
char *IEEE_P_2592010699;
char *IEEE_P_3620187407;
char *STD_STANDARD;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_a_0734482308_3212880686_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_3400501926_3212880686_init();
    work_a_2104193931_3212880686_init();
    work_a_2032694591_3212880686_init();
    work_a_1956806361_3212880686_init();
    work_a_4097156629_3212880686_init();
    work_a_3378324598_3212880686_init();
    work_a_3222946569_3212880686_init();
    work_a_2331319070_3212880686_init();
    work_a_2872328564_1181938964_init();
    work_a_1338029099_2372691052_init();


    xsi_register_tops("work_a_1338029099_2372691052");

    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    STD_STANDARD = xsi_get_engine_memory("std_standard");

    return xsi_run_simulation(argc, argv);

}

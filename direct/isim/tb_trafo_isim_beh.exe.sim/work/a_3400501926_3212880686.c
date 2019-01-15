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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Masters_Study/1st Sem/VHDL lab/Workspace/submit/direct/mulop.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_3620187407_sub_4060537613_3965413181(char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767632659_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_3400501926_3212880686_p_0(char *t0)
{
    char t3[16];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = ((IEEE_P_2592010699) + 4024);
    t5 = (t0 + 8624U);
    t1 = xsi_base_array_concat(t1, t3, t4, (char)99, (unsigned char)2, (char)97, t2, t5, (char)101);
    t6 = (1U + 16U);
    t7 = (17U != t6);
    if (t7 == 1)
        goto LAB2;

LAB3:    t8 = (t0 + 5512);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 17U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = ((IEEE_P_2592010699) + 4024);
    t5 = (t0 + 8640U);
    t1 = xsi_base_array_concat(t1, t3, t4, (char)99, (unsigned char)2, (char)97, t2, t5, (char)101);
    t6 = (1U + 16U);
    t7 = (17U != t6);
    if (t7 == 1)
        goto LAB4;

LAB5:    t8 = (t0 + 5576);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 17U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 8624U);
    t4 = (t0 + 8992);
    t8 = (t3 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 0;
    t9 = (t8 + 4U);
    *((int *)t9) = 15;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t13 = (15 - 0);
    t6 = (t13 * 1);
    t6 = (t6 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t6;
    t7 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t4, t3);
    if (t7 != 0)
        goto LAB6;

LAB8:
LAB7:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 8640U);
    t4 = (t0 + 9025);
    t8 = (t3 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 0;
    t9 = (t8 + 4U);
    *((int *)t9) = 15;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t13 = (15 - 0);
    t6 = (t13 * 1);
    t6 = (t6 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t6;
    t7 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t4, t3);
    if (t7 != 0)
        goto LAB9;

LAB11:
LAB10:    t1 = (t0 + 5352);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_size_not_matching(17U, t6, 0);
    goto LAB3;

LAB4:    xsi_size_not_matching(17U, t6, 0);
    goto LAB5;

LAB6:    xsi_set_current_line(54, ng0);
    t9 = (t0 + 9008);
    t11 = (t0 + 5512);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t9, 17U);
    xsi_driver_first_trans_fast(t11);
    goto LAB7;

LAB9:    xsi_set_current_line(57, ng0);
    t9 = (t0 + 9041);
    t11 = (t0 + 5576);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t9, 17U);
    xsi_driver_first_trans_fast(t11);
    goto LAB10;

}

static void work_a_3400501926_3212880686_p_1(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(60, ng0);

LAB3:    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 8672U);
    t4 = (t0 + 1672U);
    t5 = *((char **)t4);
    t4 = (t0 + 8688U);
    t6 = ieee_p_3620187407_sub_767632659_3965413181(IEEE_P_3620187407, t1, t3, t2, t5, t4);
    t7 = (t1 + 12U);
    t8 = *((unsigned int *)t7);
    t9 = (1U * t8);
    t10 = (34U != t9);
    if (t10 == 1)
        goto LAB5;

LAB6:    t11 = (t0 + 5640);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 34U);
    xsi_driver_first_trans_fast(t11);

LAB2:    t16 = (t0 + 5368);
    *((int *)t16) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(34U, t9, 0);
    goto LAB6;

}

static void work_a_3400501926_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(61, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = (33 - 15);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 5704);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_fast(t6);

LAB2:    t11 = (t0 + 5384);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3400501926_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(62, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = (33 - 32);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 5768);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 17U);
    xsi_driver_first_trans_fast(t6);

LAB2:    t11 = (t0 + 5400);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3400501926_3212880686_p_4(char *t0)
{
    char t6[16];
    char t9[16];
    char t24[16];
    char t25[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t7;
    char *t8;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    int t26;

LAB0:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 8768U);
    t3 = (t0 + 2632U);
    t4 = *((char **)t3);
    t3 = (t0 + 8784U);
    t5 = ieee_p_3620187407_sub_4060537613_3965413181(IEEE_P_3620187407, t2, t1, t4, t3);
    if (t5 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = ((IEEE_P_2592010699) + 4024);
    t4 = (t0 + 8768U);
    t1 = xsi_base_array_concat(t1, t24, t3, (char)99, (unsigned char)2, (char)97, t2, t4, (char)101);
    t7 = (t0 + 2632U);
    t8 = *((char **)t7);
    t7 = (t0 + 8784U);
    t10 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t9, t1, t24, t8, t7);
    t11 = (t0 + 9058);
    t13 = (t25 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 0;
    t14 = (t13 + 4U);
    *((int *)t14) = 16;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t26 = (16 - 0);
    t16 = (t26 * 1);
    t16 = (t16 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t16;
    t14 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t6, t10, t9, t11, t25);
    t15 = (t6 + 12U);
    t16 = *((unsigned int *)t15);
    t17 = (1U * t16);
    t5 = (17U != t17);
    if (t5 == 1)
        goto LAB7;

LAB8:    t19 = (t0 + 5832);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t14, 17U);
    xsi_driver_first_trans_fast(t19);

LAB3:    t1 = (t0 + 5416);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(68, ng0);
    t7 = (t0 + 2472U);
    t8 = *((char **)t7);
    t10 = ((IEEE_P_2592010699) + 4024);
    t11 = (t0 + 8768U);
    t7 = xsi_base_array_concat(t7, t9, t10, (char)99, (unsigned char)2, (char)97, t8, t11, (char)101);
    t12 = (t0 + 2632U);
    t13 = *((char **)t12);
    t12 = (t0 + 8784U);
    t14 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t6, t7, t9, t13, t12);
    t15 = (t6 + 12U);
    t16 = *((unsigned int *)t15);
    t17 = (1U * t16);
    t18 = (17U != t17);
    if (t18 == 1)
        goto LAB5;

LAB6:    t19 = (t0 + 5832);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t14, 17U);
    xsi_driver_first_trans_fast(t19);
    goto LAB3;

LAB5:    xsi_size_not_matching(17U, t17, 0);
    goto LAB6;

LAB7:    xsi_size_not_matching(17U, t17, 0);
    goto LAB8;

}

static void work_a_3400501926_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(79, ng0);

LAB3:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = (16 - 15);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 5896);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_fast_port(t6);

LAB2:    t11 = (t0 + 5432);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3400501926_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3400501926_3212880686_p_0,(void *)work_a_3400501926_3212880686_p_1,(void *)work_a_3400501926_3212880686_p_2,(void *)work_a_3400501926_3212880686_p_3,(void *)work_a_3400501926_3212880686_p_4,(void *)work_a_3400501926_3212880686_p_5};
	xsi_register_didat("work_a_3400501926_3212880686", "isim/tb_trafo_isim_beh.exe.sim/work/a_3400501926_3212880686.didat");
	xsi_register_executes(pe);
}

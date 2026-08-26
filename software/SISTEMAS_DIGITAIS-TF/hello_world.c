#include <stdio.h>
#include <unistd.h>
#include "alt_types.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include <io.h>
#include "linker.h"
#include <math.h>


#define f_sys 50000000

void calcula_max_div(float fpwm_selecionada, float duty_cycle_selecionado){

	alt_16 div, max, D;

	int max_valores = 8;

	float fc_calculado[max_valores];
	int max_calculado[max_valores];
	int D_calculado[max_valores];
	float erro_fpwm[max_valores];
	int i=0;
	float erro_min = 1e9;
	int melhor_div, melhor_max;


	float DT = duty_cycle_selecionado/100;


	for (int div=0; div<=7; div++){

		float fc = f_sys/(1<<div);
		float max = (fc/fpwm_selecionada) - 1;
		if (max> 65535){
			continue;
		}


		float f_pwm_real = fc / (round(max) + 1);

		float erro = fabs(fpwm_selecionada-f_pwm_real);
		D = round(DT*(max+1));

		fc_calculado[i] = fc;
		max_calculado[i] = round(max);
		D_calculado[i] = D;
		erro_fpwm[i] = erro;


		if(erro < erro_min){
		            erro_min = erro;
		            melhor_div = div;
		            melhor_max = round(max);
		}
		if(erro==0){
					break;
				}
		i++;
	}
	D = round(DT * (melhor_max + 1));

	IOWR_ALTERA_AVALON_PIO_DATA(PINOS_SAIDA_DIV_BASE, melhor_div);
	IOWR_ALTERA_AVALON_PIO_DATA(PINOS_SAIDA_D_BASE, D);
	IOWR_ALTERA_AVALON_PIO_DATA(PINOS_SAIDA_MAX_BASE, melhor_max);
}



int main()
{
  int selecao;
  float fpwm, duty;
  fpwm = 10000;
  duty = 50;
  calcula_max_div(fpwm, duty);
  while(1){

	  printf("Escolha uma opção:\n");
	  printf("1) Alterar DUTY CYCLE\n");
	  printf("2) Alterar Frequência do Sinal PWM\n");
	  scanf("%d", &selecao);

	  switch(selecao){
	  case 1:
		  printf("Forneça um valor de DUTY CYCLE(0 a 100%):\n");
		  scanf("%f", &duty);
		  calcula_max_div(fpwm, duty);
		  break;

	  case 2:
		  printf("Forneça um valor de frequência PWM\n");
		  scanf("%f", &fpwm);
		  calcula_max_div(fpwm, duty);
		  break;
	  default:
		  printf("Opção Inválida\n");
	  }
  }
  return 0;
}

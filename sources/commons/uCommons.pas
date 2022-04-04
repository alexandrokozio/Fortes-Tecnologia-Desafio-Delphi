unit uCommons;

interface

type
  TMessagesAppType = record
  public const
    MSG_APP_HA_OUTRA_INSTANCIA_EM_EXECUCAO = 'Há outra instância em execução.';
    MSG_DESEJA_REALMENTE_SAIR_SISTEMA = 'Deseja realmente sair do sistema?';
    MSG_SAIR_SISTEMA = 'Sair do sistema';
    MSG_REGISTRO_TOTAL_PESQUISA =  'Registro %s do total de %s registros.';
  end;

  TConstantsType = record
  public const
    TITLE_APP = 'Controle de Abastecimentos - Posto ABC';
    TITLE_CAD_COMBUSTIVEIS = 'Cadastro de Combustíveis';
    TITLE_CAD_TANQUES = 'Cadastro de Tanques';
    TITLE_CAD_BOMBAS = 'Cadastro de Bombas';
    TITLE_CAD_PRECOS = 'Cadastro de Precos';
  end;

implementation

end.

package hws.checklist;

import java.util.ArrayList;
import java.util.EmptyStackException;
import java.util.HashMap;
import java.util.Random;

import com.embarcadero.javaandroid.DBXException;
import com.embarcadero.javaandroid.DBXParameter;
import com.embarcadero.javaandroid.JSONValueType;
import com.embarcadero.javaandroid.TDBXReader;
import com.embarcadero.javaandroid.TJSONArray;
import com.embarcadero.javaandroid.TJSONObject;
import com.embarcadero.javaandroid.TJSONPair;
import com.embarcadero.javaandroid.TJSONValue;
import com.embarcadero.javaandroid.TParams;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.DatabaseUtils.InsertHelper;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableContainer.DrawableContainerState;
import android.graphics.drawable.PaintDrawable;
import android.media.ExifInterface;
import android.os.Bundle;
import android.os.Handler;
import android.telephony.TelephonyManager;
import android.text.InputType;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewParent;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;
import android.widget.LinearLayout.LayoutParams;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.TextView;

public class hwschecklistformulariochecklist extends Activity {
	private String hwsplacadigitada;
	private Hwsbanco hwsbanco;
	private ArrayList<HashMap<String,String>> hwsarraydeperguntasdochecklist; 
	private HwsConectaRest hwsRestConnection = new HwsConectaRest();
	private EditText hwsobservacoes;
	private String hwsplaca;
	private LinearLayout hwslinearLayoutheader;
	private String hwsstatuschecklist;
	private String hwscodusuariologado;
	private ProgressDialog hwsdialogusuario;
	private hwsconexaoweb hwsexisteconexaoweb = new hwsconexaoweb();
	private Handler hwshandle = new Handler();
		
	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
       
        Intent hwsIntentFormulario = getIntent();
        hwsplacadigitada 		= hwsIntentFormulario.getStringExtra("hwsveiculo");
        hwscodusuariologado 	= hwsIntentFormulario.getStringExtra("hwscodusuariologado");
        
                
        // Criando a instancia para usar o banco do dispositivo
        hwsbanco = new Hwsbanco(this);
    	
        
        // Vetor contendo todas as perguntas do checklist
        hwsarraydeperguntasdochecklist = new ArrayList<HashMap<String,String>>();
        
        ArrayList<HashMap<String, String>> hwsdadosdoveiculo = new ArrayList<HashMap<String, String>>();
        ArrayList<HashMap<String, String>> hwsperguntas = new ArrayList<HashMap<String, String>>();
        
        
        // Buscando os dados do veiculos
        
        hwsdadosdoveiculo = hwsbanco.selectdadosdoveiculo(hwsplacadigitada);        

        final String hwstipodoveiculo 	= hwsdadosdoveiculo.get(0).get("BA_TIPO");
        hwsplaca			= hwsdadosdoveiculo.get(0).get("BA_PLACA").toUpperCase();

        
        hwsperguntas	  = hwsbanco.selectperguntaspai(hwsdadosdoveiculo.get(0).get("BA_TIPO"));
        
        if (hwsperguntas.size() == 0)
        {
        	AlertDialog.Builder alertembranco = new AlertDialog.Builder(this);
        	alertembranco.setMessage("Não há nenhuma pergunta configurada para este tipo de implemento.");
        	alertembranco.setCancelable(false);
        	alertembranco.setPositiveButton("OK", new DialogInterface.OnClickListener()
			{
                public void onClick(DialogInterface arg0, int arg1) 
                {
                    hwschecklistformulariochecklist.this.finish();
                }
            });
        	alertembranco.show();        	        	
        }
        
        //Layout Geral
        LinearLayout hwslinearLayoutgeral = new LinearLayout(this);
        hwslinearLayoutgeral.setOrientation(LinearLayout.VERTICAL);
        
        
        //Layout Header
        // Status do CheckList
        // Definidos na Tag do hwslinearLayoutheader
        //1 - 		VERDE - APROVADO
        //2 - 		AMARELO - APROVADO COM RESTRICOES
        //3 - 		VERMELHO - REPROVADO

        hwslinearLayoutheader = new LinearLayout(this);
        hwslinearLayoutheader.setOrientation(LinearLayout.HORIZONTAL);
        PaintDrawable hwspaintlayoutheader = new PaintDrawable(Color.WHITE); //CHECKLIST NAO INICIADO        
        hwslinearLayoutheader.setBackgroundDrawable(hwspaintlayoutheader);

        // Criando os textos do header
        
        //Placa
        
        TextView hwslabelplaca = new TextView(this);
        hwslabelplaca.setText("PLACA:    ");
        hwslabelplaca.setTextColor(Color.BLACK);
        hwslabelplaca.setTextSize(20);
        
        TextView hwsedtplaca = new TextView(this);
        hwsedtplaca.setText(hwsplacadigitada);
        hwsedtplaca.setTextSize(20);
        hwsedtplaca.setTextColor(Color.BLACK);
        
        
        hwslinearLayoutheader.addView(hwslabelplaca);
        hwslinearLayoutheader.addView(hwsedtplaca);

        TextView hwslabelobservacoes = new TextView(this);
  		hwslabelobservacoes.setText("Observações:");
  		hwslabelobservacoes.setTextSize(20);
  		
        hwsobservacoes = new EditText(this);
        hwsobservacoes.setText(hwsbanco.hwsretornaobservacao(hwsplaca));
        hwsobservacoes.setMaxWidth(200);
                             
        Button hwsbtnenviarchecklist = new Button(this);
        hwsbtnenviarchecklist.setText("Enviar CheckList");
        hwsbtnenviarchecklist.setTextSize(20);
        hwsbtnenviarchecklist.setOnClickListener(new Button.OnClickListener()
	    {
			public void onClick(View arg0) 
	        {					
				if (hwsvalidaformulario(hwsplaca))
				{
					try 
					{
						PaintDrawable hwsdraw =  (PaintDrawable)hwslinearLayoutheader.getBackground();
						Paint hwspaint = hwsdraw.getPaint();
						int hwscor = hwspaint.getColor();	
						String hwstextobs = "";
						String hwsstatuscheck = "";
						if (hwscor == Color.RED)
						{								
							if (hwsobservacoes.getText().toString().trim().equals(hwstextobs))
							{
								hwsstatuscheck = "Reprovado";
								hwsavisaobservacoesembranco(hwsstatuscheck);
							}
							else
							{
								hwsenviachecklistparaoservidor(hwsplaca);
							}
						}						
						else if (hwscor == Color.YELLOW)
						{
							if (hwsobservacoes.getText().toString().trim().equals(hwstextobs))
							{
								hwsstatuscheck = "Aprovado com Restrições";							
								hwsavisaobservacoesembranco(hwsstatuscheck);
							}
							else
							{
								hwsenviachecklistparaoservidor(hwsplaca);
							}
						}								
						else
						{
							hwsenviachecklistparaoservidor(hwsplaca);
						}
					} catch (DBXException e) 
					{
						Toast.makeText(hwschecklistformulariochecklist.this, "Ocorreu um erro ao enviar os dados para o servidor. Erro (" + e.toString() + ")", Toast.LENGTH_LONG).show();
					}
				}
	        }
	    });

        
        Button hwsbtnexcluirchecklist = new Button(this);
        hwsbtnexcluirchecklist.setText("Excluir CheckList");
        hwsbtnexcluirchecklist.setTextSize(20);
        hwsbtnexcluirchecklist.setOnClickListener(new Button.OnClickListener()
	    {
			public void onClick(View arg0) 
	        {					

				hwscriadialogoparaexclusao();				
				
	        }
	    });
        
		
        
        hwslinearLayoutgeral.addView(hwslinearLayoutheader);
        
        ScrollView hwsscroll = new ScrollView(this);
        
        LinearLayout hwslinearLayoutformulario = new LinearLayout(this);
        hwslinearLayoutformulario.setOrientation(LinearLayout.VERTICAL);

        
  		hwscriaperguntas(this, hwslinearLayoutformulario, hwsperguntas, hwstipodoveiculo, -1, false, hwsplaca, hwsobservacoes, hwslinearLayoutheader);
  		
      	LinearLayout hwslinearLayoutfooter = new LinearLayout(this);
        hwslinearLayoutfooter.setOrientation(LinearLayout.VERTICAL);

		hwslinearLayoutfooter.addView(hwslabelobservacoes);
		hwslinearLayoutfooter.addView(hwsobservacoes);
		
		hwslinearLayoutfooter.addView(hwsbtnenviarchecklist);
		hwslinearLayoutfooter.addView(hwsbtnexcluirchecklist);
		
		
		hwslinearLayoutformulario.addView(hwslinearLayoutfooter);
  		  		
  		hwsscroll.addView(hwslinearLayoutformulario);        

      	hwslinearLayoutgeral.addView(hwsscroll);
      	            	
      	setContentView(hwslinearLayoutgeral);
	}
	
	public void hwscriaperguntas(Context hwscontext, LinearLayout hwslinearlayoutformulario, ArrayList<HashMap<String, String>> hwsperguntas, String hwstipodoveiculo, int hwsindicedainclusaodapergunta, boolean hwsperguntafilha, String hwsplaca, EditText hwsobservacoes, LinearLayout hwslinearLayoutheader)
	{
      	for (int i = 0; i < hwsperguntas.size() ; i++)
		{
      		      		
      		LinearLayout hwslinearLayoutperguntas = new LinearLayout(this);
      		hwslinearLayoutperguntas.setOrientation(LinearLayout.VERTICAL);
      		hwslinearLayoutperguntas.setId(Integer.parseInt(hwsperguntas.get(i).get("AD_CODIGO")));
      		
      		      		  	
      		TextView hwspergunta = new TextView(this);
      		
      		hwspergunta.setText(hwsperguntas.get(i).get("AD_PERGUNTA"));      		
      		hwspergunta.setId(Integer.parseInt(hwsperguntas.get(i).get("AD_CODIGO")));
      		hwspergunta.setTextSize(20);
      		hwslinearLayoutperguntas.addView(hwspergunta);

      		// Preenchendo o vetor de perguntas
      		if (hwsarraydeperguntasdochecklist.indexOf(hwsperguntas.get(i).get("AD_CODIGO")) == -1)
      		{
      			HashMap<String, String> hwshaspergunta = new HashMap<String, String>();
      			hwshaspergunta.put(hwsperguntas.get(i).get("AD_CODIGO"), hwsperguntas.get(i).get("AD_PERGUNTA"));
      			hwsarraydeperguntasdochecklist.add(hwshaspergunta);
      		}
      		
      		if (hwsperguntafilha)
      		{
      			
      			hwslinearLayoutperguntas.setBackgroundColor(Color.parseColor("#CCCCCC"));
      			hwspergunta.setTextColor(Color.BLACK);
      		}
      		
      		// Trazendo as respostas para a pergunta
            ArrayList<HashMap<String, String>> hwsrespostadapergunta = new ArrayList<HashMap<String, String>>();
      		hwsrespostadapergunta = hwsbanco.selectrespostas(hwstipodoveiculo, hwsperguntas.get(i).get("AD_CODIGO"));

      		// Se a pergunta for multipla escolha entao nao precisa criar o RadioGroup
      		if (hwsperguntas.get(i).get("AD_TIPO").equals(new String("U"))) // Unica escolha entao cria o Radio Group
      		{
      			RadioGroup hwsgruporesposta = new RadioGroup(this);
      			hwsgruporesposta = hwscriarespostaunica(this, hwslinearlayoutformulario, hwslinearLayoutperguntas, hwsrespostadapergunta, hwstipodoveiculo, hwsperguntafilha, hwsplaca, hwsobservacoes, hwslinearLayoutheader);      			
          		hwslinearLayoutperguntas.addView(hwsgruporesposta);      			
      		}
      		else // Resposta com multipla escolha (Nao cria o radiogroup)
      		{
      			hwscriarespostamultipla(this, hwslinearlayoutformulario, hwslinearLayoutperguntas, hwsrespostadapergunta, hwstipodoveiculo, hwsplaca, hwsobservacoes, hwslinearLayoutheader, hwsperguntafilha);
      		}
      		
      		TextView hwsseparacao = new TextView(this);
      		hwsseparacao.setBackgroundColor(Color.parseColor("#FFCC00"));
      		hwsseparacao.setTextSize(2);
      		hwslinearLayoutperguntas.addView(hwsseparacao);

      		hwslinearlayoutformulario.addView(hwslinearLayoutperguntas, hwsindicedainclusaodapergunta+1);
		}			
	}
	
	public void hwscriarespostamultipla(Context hwscontext, LinearLayout hwslinearlayoutformulario, LinearLayout hwslinearLayoutperguntas, ArrayList<HashMap<String, String>> hwsrespostadapergunta, String hwstipodoveiculo, String hwsplaca, EditText hwsobservacoes, LinearLayout hwslinearLayoutheader, boolean hwsperguntafilha)
	{
		for (int p = 0; p < hwsrespostadapergunta.size() ; p++)
		{
			// Criando a resposta
			CheckBox hwsresposta = new CheckBox(hwscontext);
			hwsresposta.setText(hwsrespostadapergunta.get(p).get("AF_RESPOSTA"));
			hwsresposta.setId(Integer.parseInt(hwsrespostadapergunta.get(p).get("AH_ID")));
			hwsresposta.setTextSize(20);
			
			if (hwsperguntafilha)
      		{
      			
      			hwslinearLayoutperguntas.setBackgroundColor(Color.parseColor("#CCCCCC"));
      			hwsresposta.setTextColor(Color.BLACK);
      		}
			
			// Definindo o evento onclick na resposta
			final String hwsperguntaonclick = hwsrespostadapergunta.get(p).get("AD_CODIGO");
			final String hwsrespostaonclick = hwsrespostadapergunta.get(p).get("AF_CODIGO");
			final LinearLayout hwslinearlayoutperguntasonclick = hwslinearLayoutperguntas;
			final LinearLayout hwslinearlayoutformularioonclick = hwslinearlayoutformulario;
			final Context hwscontextonclick = hwscontext;
			final String hwstipoveiculoonclick = hwstipodoveiculo;
			final String hwsplacaonclick = hwsplaca;
			final String hwsidrespostaonclick = String.valueOf(hwsresposta.getId());
			final String hwstipoperguntaonclick = "M";
			final EditText hwsobservacoesonclick = hwsobservacoes;
			final LinearLayout hwslinearLayoutheaderonclick = hwslinearLayoutheader;
			hwsresposta.setOnCheckedChangeListener(new CheckBox.OnCheckedChangeListener()
		    {
				public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) 
				{
					if (buttonView.getId() != -1) //Isso foi uma maneira de saber se o click veio do usuario ou do evento setchecked(true)
					{
						if (isChecked)
						{				
							//Gravando a resposta no banco
							hwsgravarespostas(hwsperguntaonclick, hwsplacaonclick, hwsidrespostaonclick);
							// Criando as perguntas filhas	
							hwscriaperguntasfilhas(hwsperguntaonclick, hwsrespostaonclick, hwslinearlayoutformularioonclick, hwslinearlayoutperguntasonclick, hwscontextonclick, hwstipoveiculoonclick, hwsplacaonclick, hwsobservacoesonclick, hwslinearLayoutheaderonclick);
							// Verifica se a pergunta e resposta sao de reprovacao do checklist
							hwsperguntaerespostareprovacao(hwstipoveiculoonclick, hwsperguntaonclick, hwsidrespostaonclick, hwsobservacoesonclick, hwslinearLayoutheaderonclick, hwsplacaonclick);
						}
						else
						{
							//Excluindo a resposta no banco
							hwsexcluirespostas(hwsperguntaonclick, hwstipoperguntaonclick, hwsplacaonclick, hwsidrespostaonclick);
							// Se caso estiver mostrando perguntas filhas da pergunta e resposta selecionada entao exclui as perguntas para nao aparecerem
							hwsexcluirperguntasfilhas(hwsperguntaonclick, hwsrespostaonclick, hwslinearlayoutformularioonclick);						
							// Verifica se a pergunta e resposta sao de reprovacao do checklist
							hwsperguntaerespostareprovacao(hwstipoveiculoonclick, hwsperguntaonclick, hwsidrespostaonclick, hwsobservacoesonclick, hwslinearLayoutheaderonclick, hwsplacaonclick);
						}
					}
					else
					{
						buttonView.setId(Integer.parseInt(hwsidrespostaonclick));
						// Criando as perguntas filhas	
						hwscriaperguntasfilhas(hwsperguntaonclick, hwsrespostaonclick, hwslinearlayoutformularioonclick, hwslinearlayoutperguntasonclick, hwscontextonclick, hwstipoveiculoonclick, hwsplacaonclick, hwsobservacoesonclick, hwslinearLayoutheaderonclick);
						// Reprovacao
						hwsperguntaerespostareprovacao(hwstipoveiculoonclick, hwsperguntaonclick, hwsidrespostaonclick, hwsobservacoesonclick, hwslinearLayoutheaderonclick, hwsplacaonclick);
					}
					// Mensagem de Reprovacao do CheckList
					//hwsmensagemdereprovacaodochecklist(hwslinearLayoutheaderonclick);
				}
		    });
			// Verificando se esta resposta ja esta gravada no banco, se estiver entao seleciona
			if (hwsbanco.respostajagravadanobanco(hwsplaca, hwsrespostadapergunta.get(p).get("AH_ID")))      		
      		{
				hwsresposta.setId(-1);
				hwsresposta.setChecked(true);      			
      		}
			hwslinearLayoutperguntas.addView(hwsresposta);
		}    
	}
	
	public RadioGroup hwscriarespostaunica(Context hwscontext, LinearLayout hwslinearlayoutformulario, LinearLayout hwslinearLayoutperguntas, ArrayList<HashMap<String, String>> hwsrespostadapergunta, String hwstipodoveiculo, boolean hwsperguntafilha, String hwsplaca, EditText hwsobservacoes, LinearLayout hwslinearLayoutheader)
	{		

		RadioGroup hwsgruporesposta = new RadioGroup(hwscontext);
		for (int p = 0; p < hwsrespostadapergunta.size() ; p++)
		{
			// Criando a resposta
			RadioButton hwsresposta = new RadioButton(hwscontext);
			hwsresposta.setText(hwsrespostadapergunta.get(p).get("AF_RESPOSTA"));
			hwsresposta.setId(Integer.parseInt(hwsrespostadapergunta.get(p).get("AH_ID")));
			hwsresposta.setTextSize(20);
			
			if (hwsperguntafilha)
			{
				hwsresposta.setTextColor(Color.BLACK);
			}
			// Definindo o evento onclick na resposta
			final String hwsperguntaonclick = hwsrespostadapergunta.get(p).get("AD_CODIGO");
			final String hwsrespostaonclick = hwsrespostadapergunta.get(p).get("AF_CODIGO");
			final LinearLayout hwslinearlayoutperguntasonclick = hwslinearLayoutperguntas;
			final LinearLayout hwslinearlayoutformularioonclick = hwslinearlayoutformulario;
			final Context hwscontextonclick = hwscontext;
			final String hwstipoveiculoonclick = hwstipodoveiculo;
			final String hwstipoperguntaonclick = "U";
			final String hwsplacaonclick = hwsplaca;
			final String hwsidrespostaonclick = String.valueOf(hwsresposta.getId());
			final EditText hwsobservacoesonclick = hwsobservacoes;
			final LinearLayout hwslinearLayoutheaderonclick = hwslinearLayoutheader;
			hwsresposta.setOnClickListener(new RadioButton.OnClickListener()
		    {
				public void onClick(View arg0) 
		        {					
					if (arg0.getId() != -1) //Isso foi uma maneira de saber se o click veio do usuario ou do evento performclick()
					{
						// Exclui as respostas ja selecionadas anterioriormente no banco
						hwsexcluirespostas(hwsperguntaonclick, hwstipoperguntaonclick, hwsplacaonclick, hwsidrespostaonclick);
						// Grava a resposta selecionada no banco
						hwsgravarespostas(hwsperguntaonclick,hwsplacaonclick, hwsidrespostaonclick);
						// Se caso estiver mostrando perguntas filhas da pergunta e resposta selecionada entao exclui as perguntas para nao aparecerem
						hwsexcluirperguntasfilhas(hwsperguntaonclick, hwsrespostaonclick, hwslinearlayoutformularioonclick);
						// Criando as perguntas filhas	
						hwscriaperguntasfilhas(hwsperguntaonclick, hwsrespostaonclick, hwslinearlayoutformularioonclick, hwslinearlayoutperguntasonclick, hwscontextonclick, hwstipoveiculoonclick, hwsplacaonclick, hwsobservacoesonclick, hwslinearLayoutheaderonclick);
						// Verifica se a pergunta e resposta sao de reprovacao do checklist
						hwsperguntaerespostareprovacao(hwstipoveiculoonclick, hwsperguntaonclick, hwsidrespostaonclick, hwsobservacoesonclick, hwslinearLayoutheaderonclick, hwsplacaonclick);
					}
					else
					{
						arg0.setId(Integer.parseInt(hwsidrespostaonclick));
						// Criando as perguntas filhas	
						hwscriaperguntasfilhas(hwsperguntaonclick, hwsrespostaonclick, hwslinearlayoutformularioonclick, hwslinearlayoutperguntasonclick, hwscontextonclick, hwstipoveiculoonclick, hwsplacaonclick, hwsobservacoesonclick, hwslinearLayoutheaderonclick);
						// Reprovacao
						hwsperguntaerespostareprovacao(hwstipoveiculoonclick, hwsperguntaonclick, hwsidrespostaonclick, hwsobservacoesonclick, hwslinearLayoutheaderonclick, hwsplacaonclick);
					}
					// Mensagem de Reprovacao do CheckList
					//hwsmensagemdereprovacaodochecklist(hwslinearLayoutheaderonclick);
				}
		    });
			// Verificando se esta resposta ja esta gravada no banco, se estiver entao seleciona
			if (hwsbanco.respostajagravadanobanco(hwsplaca, hwsrespostadapergunta.get(p).get("AH_ID")))      		
      		{	
				hwsresposta.setId(-1);
      			hwsresposta.performClick();
      		}
			// Adicionando a resposta no grupo de respostas
			hwsgruporesposta.addView(hwsresposta);
		}
		return hwsgruporesposta;    	
	}
	
	public void hwsexcluirperguntasfilhas(String hwspergunta, String hwsresposta, LinearLayout hwslinearlayoutformulario)
	{
		ArrayList<HashMap<String, String>> hwsperguntasfilhasexclusao = new ArrayList<HashMap<String, String>>();
		ArrayList<HashMap<String, String>> hwsperguntasfilhasexclusaofilhas = new ArrayList<HashMap<String, String>>();
		
		hwsperguntasfilhasexclusao = hwsbanco.selectperguntasfilhasparaexclusao(hwspergunta);
	
		for (int e = 0; e < hwsperguntasfilhasexclusao.size() ; e++)
		{
			View hwslinearlayoutexclusao = hwslinearlayoutformulario.findViewById(Integer.parseInt(hwsperguntasfilhasexclusao.get(e).get("AD_CODIGO")));
			if (hwslinearlayoutexclusao != null)
			{
				
				// Excluindo as perguntas do array de perguntas
				HashMap<String, String> hwshasperguntasfilhas = new HashMap<String,String>();
				hwshasperguntasfilhas.put(hwsperguntasfilhasexclusao.get(e).get("AD_CODIGO"), hwsperguntasfilhasexclusao.get(e).get("AD_PERGUNTA"));
				int hwsindexperguntafilha = hwsarraydeperguntasdochecklist.indexOf(hwshasperguntasfilhas); 
				if (hwsindexperguntafilha != -1)
				{
					hwsarraydeperguntasdochecklist.remove(hwsindexperguntafilha);
				}
				
				//Verificando se existem perguntas filhas da pergunta filha
				hwsperguntasfilhasexclusaofilhas = hwsbanco.selectperguntasfilhasparaexclusao(hwsperguntasfilhasexclusao.get(e).get("AD_CODIGO"));
				for (int r = 0; r < hwsperguntasfilhasexclusaofilhas.size() ; r++)
				{
					View hwslinearlayoutexclusaofilhas = hwslinearlayoutformulario.findViewById(Integer.parseInt(hwsperguntasfilhasexclusaofilhas.get(r).get("AD_CODIGO")));
					if (hwslinearlayoutexclusaofilhas != null)
					{
						// Excluindo as perguntas do array de perguntas
						HashMap<String, String> hwshasperguntasfilhasdasfilhas = new HashMap<String,String>();
						hwshasperguntasfilhasdasfilhas.put(hwsperguntasfilhasexclusaofilhas.get(r).get("AD_CODIGO"), hwsperguntasfilhasexclusaofilhas.get(r).get("AD_PERGUNTA"));
						int hwsindexperguntafilhadafilha = hwsarraydeperguntasdochecklist.indexOf(hwshasperguntasfilhasdasfilhas); 
						if (hwsindexperguntafilhadafilha != -1)
						{
							hwsarraydeperguntasdochecklist.remove(hwshasperguntasfilhasdasfilhas);
						}
						
						hwslinearlayoutformulario.removeView(hwslinearlayoutexclusaofilhas);
					}
				}
				hwslinearlayoutformulario.removeView(hwslinearlayoutexclusao);
			}			
		}
	}
	
	public void hwscriaperguntasfilhas(String hwspergunta, String hwsresposta, LinearLayout hwslinearlayoutformulario, LinearLayout hwslayoutdapergunta, Context hwscontextonclick, String hwstipodoveiculo, String hwsplaca, EditText hwsobservacoes, LinearLayout hwslinearLayoutheader)
	{
		ArrayList<HashMap<String, String>> hwsperguntasfilhas = new ArrayList<HashMap<String, String>>();
		
		hwsperguntasfilhas = hwsbanco.selectperguntasfilhas(hwspergunta, hwsresposta);
		
		hwscriaperguntas(hwscontextonclick, hwslinearlayoutformulario, hwsperguntasfilhas, hwstipodoveiculo, hwslinearlayoutformulario.indexOfChild(hwslayoutdapergunta), true, hwsplaca, hwsobservacoes, hwslinearLayoutheader);
						
	}
	
	public void hwsexcluirespostas(String hwspergunta, String hwstipopergunta, String hwsplaca, String hwsidresposta)
	{
		// Verifica o tipo da pergunta, caso seja unica exclui o que tem de resposta no banco antes de incluir uma nova resposta
		if (hwstipopergunta.equals(new String("U")))
		{
			hwsbanco.excluirespostasdaperguntaunicas(hwspergunta, hwsplaca);			
		}
		else
		{
			// Se for multipla escolha so exclui a resposta desmarcada, as outras ficam no banco de dados
			hwsbanco.excluirespostasdaperguntamultiplas(hwspergunta, hwsplaca, hwsidresposta);
		}
		// Excluindo as respostas filhas que ja foram selecionadas da pergunta
		ArrayList<HashMap<String, String>> hwsperguntasfilhasexclusao = hwsbanco.selectperguntasfilhasparaexclusao(hwspergunta);
		for (int e = 0; e < hwsperguntasfilhasexclusao.size() ; e++)
		{
			// Uso a mesma funcao excluirespostasdaperguntaunicas para excluir as filhas porque estou dando um for somente nas perguntas filhas da pergunta pai
			hwsbanco.excluirespostasdaperguntaunicas(hwsperguntasfilhasexclusao.get(e).get("AD_CODIGO") , hwsplaca);
			// Excluindo as perguntas filhas das filhas
			ArrayList<HashMap<String, String>> hwsperguntasfilhasexclusaofilhas = hwsbanco.selectperguntasfilhasparaexclusao(hwsperguntasfilhasexclusao.get(e).get("AD_CODIGO"));
			for (int r = 0; r < hwsperguntasfilhasexclusaofilhas.size() ; r++)
			{
				hwsbanco.excluirespostasdaperguntaunicas(hwsperguntasfilhasexclusaofilhas.get(r).get("AD_CODIGO") , hwsplaca);
			}			
		}
	}
	
	public void hwsgravarespostas(String hwspergunta, String hwsplaca, String hwsidresposta)
	{
		// Inclui a pergunta no banco
		InsertHelper hwsinserthelper = new InsertHelper(hwsbanco.db, "checklistsrealizados");
		int hwscoluna_BB_PLACA 		= hwsinserthelper.getColumnIndex("BB_PLACA");
		int hwscoluna_BB_PERGUNTA  	= hwsinserthelper.getColumnIndex("BB_PERGUNTA");
		int hwscoluna_BB_ID  		= hwsinserthelper.getColumnIndex("BB_ID");
		try
		{
			
			hwsinserthelper.prepareForInsert();
			
			hwsinserthelper.bind(hwscoluna_BB_PLACA, 	hwsplaca);
			hwsinserthelper.bind(hwscoluna_BB_PERGUNTA, hwspergunta);
			hwsinserthelper.bind(hwscoluna_BB_ID, 		hwsidresposta);
			
			hwsinserthelper.execute();
		}
		finally
		{
			hwsinserthelper.close();				
		}		
	}
	
	public void hwsperguntaerespostareprovacao(String hwstipoimplemento, String hwspergunta, String hwsidresposta, final EditText hwsobservacoes, final LinearLayout hwslinearLayoutheader, String hwsplaca)
	{
		// Verifica se a pergunta e a resposta esta sao reprovacao do checklist
		if (hwsbanco.perguntaerespostareprovacao(hwstipoimplemento, hwspergunta, hwsidresposta))
		{			
            PaintDrawable hwspaintlayoutheader = new PaintDrawable(Color.RED);        
            hwslinearLayoutheader.setBackgroundDrawable(hwspaintlayoutheader);
		}
		else
		{
			if (hwsbanco.existeperguntaerespostareprovacao(hwstipoimplemento, hwsplaca))
			{
		        PaintDrawable hwspaintlayoutheader = new PaintDrawable(Color.RED);        
		        hwslinearLayoutheader.setBackgroundDrawable(hwspaintlayoutheader);
				
			} 
			else if (hwsbanco.existeperguntaerespostarestricao(hwsplaca, hwstipoimplemento))
			{
		        PaintDrawable hwspaintlayoutheader = new PaintDrawable(Color.YELLOW);        
		        hwslinearLayoutheader.setBackgroundDrawable(hwspaintlayoutheader);
 
			}
			else
			{
				PaintDrawable hwspaintlayoutheader = new PaintDrawable(Color.GREEN);        
		        hwslinearLayoutheader.setBackgroundDrawable(hwspaintlayoutheader);
		        hwslinearLayoutheader.setTag(2); // CHECKLIST NAO INICIADO
			}
		}
	}
	
	public void hwsmensagemdereprovacaodochecklist(LinearLayout hwslinearLayoutheader)
	{
        // Status do CheckList
        
		//01 - 		VERDE 		- APROVADO
        //02 - 		AMARELO 	- APROVADO COM RESTRICOES
        //03 - 		VERMELHO 	- REPROVADO

		PaintDrawable hwsdraw =  (PaintDrawable)hwslinearLayoutheader.getBackground();
		Paint hwspaint = hwsdraw.getPaint();
		int hwscor = hwspaint.getColor();
		
		if (hwscor == Color.RED)
		{
			Toast.makeText(hwschecklistformulariochecklist.this, "Não é necessário continuar respondendo as perguntas, pois o CheckList já está reprovado.", Toast.LENGTH_LONG).show();					
		}	
	}

	public boolean hwsvalidaformulario(String hwsplaca)
	{
		boolean hwsreturn = true;
		for (int v = 0; v < hwsarraydeperguntasdochecklist.size() ; v++) 
		{
			String hwscodpergunta = hwsarraydeperguntasdochecklist.get(v).keySet().toString().replace("[", "");
			hwscodpergunta	= hwscodpergunta.replace("]", "");
			if (! hwsbanco.hwsaperguntafoirespondida(hwsplaca, hwscodpergunta))
			{
				Toast.makeText(hwschecklistformulariochecklist.this, "A pergunta '" + hwsarraydeperguntasdochecklist.get(v).get(hwscodpergunta)  + "' precisa ser respondida no Checklist.", Toast.LENGTH_LONG).show();
				hwsreturn = false;
				break;
			}
		}
		return hwsreturn;		
	}
	
	public void hwsenviachecklistparaoservidor(final String hwsplaca) throws DBXException
	{
		AlertDialog.Builder builderenviar = new AlertDialog.Builder(this); 
		builderenviar.setMessage("Tem certeza que deseja enviar o Checklist?"); 
		builderenviar.setCancelable(false); 
		builderenviar.setPositiveButton("Sim", new DialogInterface.OnClickListener() 
		{ 
			public void onClick(DialogInterface dialog, int id) 
			{ 
				try 
				{
					hwsconfirmarenviodochecklist(hwsplaca);
				} catch (DBXException e) 
				{
					Toast.makeText(hwschecklistformulariochecklist.this, "Ocorreu um erro ao enviar os dados para o servidor. Erro (" + e.toString() + ")", Toast.LENGTH_LONG).show();
				}
			} 
		}); 
		builderenviar.setNegativeButton("Não", new DialogInterface.OnClickListener() 
		{ 
			public void onClick(DialogInterface dialog, int id) 
			{ 
				dialog.cancel(); 
			} 
		}); 
		AlertDialog alertenviar = builderenviar.create();	
		alertenviar.show();
	}
	
	public void hwsavisaobservacoesembranco(String hwsretstatus)
	{
		AlertDialog.Builder builderenviar = new AlertDialog.Builder(this); 
		builderenviar.setMessage("O campo observações deve ser preenchido quando o CheckList está " + hwsretstatus); 
		builderenviar.setCancelable(false); 
		builderenviar.setPositiveButton("OK", new DialogInterface.OnClickListener() 
		{ 
			public void onClick(DialogInterface dialog, int id) 
			{ 
				dialog.cancel();
				hwsobservacoes.setFocusable(true);
			} 
		}); 		
		AlertDialog alertenviar = builderenviar.create();	
		alertenviar.show();
	}
	
	public void hwsconfirmarenviodochecklist(final String hwsplaca) throws DBXException
	{
    	hwsdialogusuario = ProgressDialog.show(hwschecklistformulariochecklist.this, "Aguarde...", "Enviando CheckList para o servidor...",false,true);
    	hwsdialogusuario.setCancelable(false);
    	hwsdialogusuario.setCanceledOnTouchOutside(false);
    	new Thread()
    	{
    		@Override
    		public void run()
    		{

    			// Status do CheckList
	        
				//01 - 		VERDE 		- APROVADO
		        //02 - 		AMARELO 	- APROVADO COM RESTRICOES
		        //02 - 		VERMELHO 	- REPROVADO
				PaintDrawable hwsdraw =  (PaintDrawable)hwslinearLayoutheader.getBackground();
				Paint hwspaint = hwsdraw.getPaint();
				int hwscor = hwspaint.getColor();
				if (hwscor == Color.GREEN)
				{
					hwsstatuschecklist = "01";
				}
				else if (hwscor == Color.YELLOW)
				{
					hwsstatuschecklist = "02";			
				}
				else if (hwscor == Color.RED)
				{
					hwsstatuschecklist = "03";			
				}
				
				//atualiza a observacao 
				
				hwsbanco.updateobservacaoestatusecoduser(hwsplaca, hwsobservacoes.getText().toString(), hwsstatuschecklist, hwscodusuariologado);
	
			
				TJSONArray hwsenviachecklist = new TJSONArray();
				
				ArrayList<HashMap<String, String>> hwsdadosselectchecklistenviar = hwsbanco.hwsselectchecklist(hwsplaca);
				for (int i = 0; i < hwsdadosselectchecklistenviar.size(); i++) 
				{
					
					TJSONArray hwsenviachecklistregistro = new TJSONArray();
					
					hwsenviachecklistregistro.add(hwsdadosselectchecklistenviar.get(i).get("BB_PLACA"));
					hwsenviachecklistregistro.add(hwsdadosselectchecklistenviar.get(i).get("BB_PERGUNTA"));
					hwsenviachecklistregistro.add(hwsdadosselectchecklistenviar.get(i).get("BB_ID"));
					hwsenviachecklistregistro.add(hwsdadosselectchecklistenviar.get(i).get("A9_CODIGO"));
					hwsenviachecklistregistro.add(hwsdadosselectchecklistenviar.get(i).get("BB_OBS"));
					hwsenviachecklistregistro.add(hwsdadosselectchecklistenviar.get(i).get("BB_STATUS"));
					hwsenviachecklistregistro.add(hwsdadosselectchecklistenviar.get(i).get("BB_CODUSER"));
					
					hwsenviachecklist.add(hwsenviachecklistregistro);
					
				}
				
				if (hwsdadosselectchecklistenviar.size() > 0)
				{
					
					if (hwsexisteconexaoweb.hwsverificaconexao(hwschecklistformulariochecklist.this))
	    			{
						TelephonyManager mTelephonyMgr;
				        mTelephonyMgr = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);      
				        String Hws_Chip = mTelephonyMgr.getDeviceId();
						// Se caso o status do telefone esta ok entao envia							
			    		try 
			    		{			
			    			// 	Verifica o status do chip
			    			TJSONArray Hws_Status_Chip = new TJSONArray();
			    			Hws_Status_Chip = hwsRestConnection.HwsPegarServerMetodos().F_HWS_RetornaStatusChip(Hws_Chip);
			    			String Hws_Status_Chip_OK = new String("S");
			    			// Se o primeiro elemento do vetor for S entao o Chip esta OK
			    			if (Hws_Status_Chip.getString(0).equals(Hws_Status_Chip_OK))
			    			{	
				    			TJSONArray hwsresultado = new TJSONArray();
				    			hwsresultado = hwsRestConnection.HwsPegarServerMetodos().F_HWS_GravaCheckListRealizado(Hws_Chip, hwsenviachecklist);
				    			String String_hwsresultado_OK = new String("S");
				    			if (hwsresultado.getString(0).equals(String_hwsresultado_OK))
				    			{
				    				// Como nao ocorreu erro exclui do movel o checklist ja realizado
				    				hwsbanco.excluichecklistjarealizado(hwsplaca);
				    				hwsfinalizadialogo(false, "");
				    			}
				    			else
				    			{
				    				hwsfinalizadialogo(true, "Erro (" + hwsresultado.getString(1).toString() + ")");
				    			}
				    		}
			    			else
							{
			    				hwsfinalizadialogo(true, "Erro (" + Hws_Status_Chip.getString(1) + ")");
							}
			    		}
				    	catch (DBXException e) 
						{
				    		hwsfinalizadialogo(true, "Erro (" + e.toString() + ")");
						}				    		
	    			}
					else
					{
						hwsfinalizadialogo(true, "Não há conexão com a Internet para enviar o CheckList. O CheckList ficará na lista de CheckLists Pendentes.");
					}
				}
    		}
    	}.start();
	}
	
	public void hwsfinalizadialogo(final Boolean hwstemerro, final String hwsmensagem)
    {
    	hwshandle.post(new Runnable() {
			
			//@Override
			public void run() {
				if (hwstemerro)
				{
					Toast.makeText(hwschecklistformulariochecklist.this, hwsmensagem, Toast.LENGTH_LONG).show();
				}
				hwsdialogusuario.dismiss();
				hwschecklistformulariochecklist.this.finish();
			}
		});    	    	   
    }

	
	public void hwscriadialogoparaexclusao()
	{
		AlertDialog.Builder builder = new AlertDialog.Builder(this); 
		builder.setMessage("Tem certeza que deseja excluir este checklist?"); 
		builder.setCancelable(false); 
		builder.setPositiveButton("Sim", new DialogInterface.OnClickListener() 
		{ 
			public void onClick(DialogInterface dialog, int id) 
			{ 
				hwsexcluichecklistpelobotao();
			} 
			}); 
		builder.setNegativeButton("Não", new DialogInterface.OnClickListener() 
		{ 
			public void onClick(DialogInterface dialog, int id) 
			{ 
				dialog.cancel(); 
			} 
		}); 
		AlertDialog alert = builder.create();	
		alert.show();
	}

	public void hwsexcluichecklistpelobotao()
	{
		hwsbanco.excluichecklistjarealizado(hwsplaca);
		hwschecklistformulariochecklist.this.finish();
	}
	
	@Override
	public void onPause() 
	{
		super.onPause();
		
		//if (hwsdialogusuario != null)
		//{
		//	hwsdialogusuario.dismiss();
		//}
		// Gravando a observacao			
        // Status do CheckList        
		//02 - 		VERDE 		- APROVADO
        //03 - 		AMARELO 	- APROVADO COM RESTRICOES
        //04 - 		VERMELHO 	- REPROVADO
		hwsstatuschecklist = "";
		PaintDrawable hwsdraw =  (PaintDrawable)hwslinearLayoutheader.getBackground();
		Paint hwspaint = hwsdraw.getPaint();
		int hwscor = hwspaint.getColor();
		if (hwscor == Color.GREEN)
		{
			hwsstatuschecklist = "01";
		}
		else if (hwscor == Color.RED)
		{
			hwsstatuschecklist = "02";			
		}
		else if (hwscor == Color.WHITE)
		{
			hwsstatuschecklist = "03";			
		}
		hwsbanco.updateobservacaoestatusecoduser(hwsplaca, hwsobservacoes.getText().toString(), hwsstatuschecklist, hwscodusuariologado);
		hwsbanco.close();
	}
}
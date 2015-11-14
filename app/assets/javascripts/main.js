

function funcTab(n) {
   var NTab = document.getElementsByClassName('tab').length;
  for (var i=1; i < NTab+1; i++) {
    if (i != n){
     document.getElementById('tab'+i).className = 'tab';
     document.getElementById('tab_content'+i).className = 'tab_content'
     }
  }
   document.getElementById('tab'+n).className = 'tab active';
   document.getElementById('tab_content'+n).className = 'tab_content active';
}

function new() {
var news = 5; // - количество отображаемых новостей
	    hidenews = "Скрыть другие новости";

    shownews = "Показать еще";

    $(".archive").html( shownews );
    $(".news:not(:lt("+news+"))").hide();

    $(".archive").click(function (e){
      e.preventDefault();
      if( $(".news:eq("+news+")").is(":hidden") )
      {
        $(".news:hidden").show();
        $(".archive").html( hidenews );
      }
      else
      {
        $(".news:not(:lt("+news+"))").hide();
        $(".archive").html( shownews );
      }
    });
	}
	
	
	
if(typeof cFM_classError === 'undefined')
	var cFM_classError='cFM_wrong';
var cFM_checkedGroups=',';

function cFM_checkFullness(handle)
{
	var error = true;
	var attribute = $(handle).attr('cFM_check');
	
	var required = true;
	if(attribute.indexOf('Y')===-1)
		required=false;
	var format=attribute;
	if(required)
		format=attribute.substr(2);
	switch($(handle).attr('type'))
	{
		case 'checkbox': 
			if(!$(handle).prop('checked'))
				error=false;
			break;
		case 'radio': 
			if(!$(handle).prop('checked') && $('[name="'+$(handle).attr('name')+'"]:checked').length==0)
				error=false;
			else
				error=true;
			break;
		default: 
			if(($(handle).val().trim().length==0 || $(handle).val()=='0')&&required)
				error=false;
			else
			{
				if(format==='num')
				{
					var regCheck = new RegExp('[^0-9\s-]+');
					if(regCheck.test($(handle).val()))
						error='wrong';
				}
				if(format==='email')
				{
					var regCheck = new RegExp("^([0-9a-zA-Z]+[-._+&amp;])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}$");
					if(!regCheck.test($(handle).val()))
						error='wrong';
				}
			}
		break;
	}
	return error;
}

function cFM_prepareChecking(handle)
{
	var error=true;//возвращаемое значение; смысл - просто показать, что есть ошибка принимает значение: true - нет ошибок; false - поле не заполнено; 'wrong' - поле заполнено неправильно; 'radio' - радиокнопка отмечена и нет ошибок
	var title = " значение поля";
	if(typeof $(handle).attr('title') !== 'undefined' && $(handle).attr('title').length>0)
		title=$(handle).attr('title');
	var after = handle;
	var attribute = $(handle).attr('cFM_check');
	if(typeof $(handle).attr('cFM_function') !== 'undefined')
		var chkFunk=$(handle).attr('cFM_function');
		
	if(typeof chkFunk !== 'undefined')
		error=window[chkFunk]($(handle));
	else
		error=cFM_checkFullness(handle);
	if(error!==true)
	{
		if(typeof $(handle).attr('cFM_confirmInfo') !== 'undefined')
		{
			after=$(handle).attr('cFM_confirmInfo');
			if(after.indexOf('self')===0)//если вдруг селфы непойми зачем прилепили
				after=after.substr(4);
		}
		
		if(error==='wrong')
			$(after).after("<div class='"+cFM_classError+"'>Неверное значение поля</div>");
		else
		{
			if(error===false)
				$(after).after("<div class='"+cFM_classError+"'>Укажите "+title+"</div>");//html ошибки
			else
				$(after).after("<div class='"+cFM_classError+"'>"+error+"</div>");//если особая проверка с особой html
		}
		$(handle).addClass(cFM_classError);
		if($(handle).attr('type')=='radio')
			$('[name="'+$(handle).attr('name')+'"]').addClass(cFM_classError);
		
		error=false;
	}
	return error;
}

function cFM_checktrueAttr(parent)
{
	var error=true;
	cFM_checkedGroups=',';
	
	$('div.'+cFM_classError).remove();
	$('.'+cFM_classError).each(function(){
		$(this).removeClass(cFM_classError);
	});	
	
	var inputsToHandle=false;

	if(typeof parent !== 'undefined')
		inputsToHandle=parent.find('[cFM_check]');
	else
		inputsToHandle=$('[cFM_check]');
	inputsToHandle.each(function(){
		if(error) error=cFM_prepareChecking(this);
		else cFM_prepareChecking(this);
	}); 

	return error;
}	
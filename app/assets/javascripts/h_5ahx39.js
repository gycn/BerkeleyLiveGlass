function submitForm(action)
{
    document.getElementById('form1').action = action;
    document.getElementById('form1').submit();
}

function submit_paypal()
{
	$("#paypal_form").submit();
}


function reveal_reserve_form()
{
	$("#paypal_form").parent().html("<div role='form' class='wpcf7' id = 'reserve_form' lang='en-US' dir='ltr'><form class='wpcf7-form' action = '' method = 'post' ><input type='hidden' name='form_title' value='Live Glass Orders'/><div id='form_inline'><p><span><input type='text' value='' id = 'order_name' name = 'order_name' size='40' placeholder='Name' required></span></p><p><span><input type='email' value='' size='40'  id='order_email' name = 'order_email' placeholder='Email' required></span> </p><p><span'><input type='tel' value='' size='40'  id='order_tel' name = 'order_tel' placeholder='Phone Number'></span></p><p id='order_quantity'><span><input type='number' value='' min='1' max='200' placeholder='Quantity' name = 'order_quantity' required></span> </p></div><p id='form_extra'><span><textarea cols='40' rows='10' id='order_instructions' placeholder='Extra Instructions' name = 'order_instructions'></textarea></span> </p><p id='form_submit'><input type = 'button' value = 'Cancel' onclick = 'reveal_paypal_button()'><input type='submit' value='Reserve'></p></form></div>");
     //$("#paypal_form").parent().html("<form action = '' method = 'post'><input type='hidden' name='form_title' value='People'/><input type = 'text' name='lname'/><input type = 'submit'/></form>");
}

function reveal_paypal_button()
{
	$("#reserve_form").parent().html("<form action='https://www.paypal.com/cgi-bin/webscr' method='post' target='_top' class='et_pb_text_align_center' id='paypal_form'> <input type='hidden' name='cmd' value='_s-xclick'> <input type='hidden' name='hosted_button_id' value='T29TENMM58SVE'> <input type='button' onclick='submit_paypal()' value='Paypal' class='paypal_button'> <input type='button' onclick='reveal_reserve_form()' value='Reserve' class='paypal_button'></form>");
}

<?php
require 'initapp.php';
include_once("sslwireless_conf.php");

$self='send-sms-from-file.php';

if (isset($_POST['submit'])){
    $sender_id=_post('sender_id');
    $sender_id=urlencode($sender_id);
    $message=_post('message');
    $message = htmlspecialchars($message); 	
               $sip = $_SERVER['REMOTE_ADDR'];
    $gateway=_post('gateway');

    if($sender_id==''){
        conf($self,'e','Please Insert Sender ID/ Masking Name');
    }
    if($message==''){
        conf($self,'e','Please Insert Message');
    }

    $msgcount = strlen($message);
    $msgcount = $msgcount / 160;
    $msgcount = ceil($msgcount);

    if((!empty($_FILES["uploaded_file"])) && ($_FILES['uploaded_file']['error'] == 0)) {
        $filename = basename($_FILES['uploaded_file']['name']);
        $ext = substr($filename, strrpos($filename, '.') + 1);
        if (($ext == "txt") &&  ($_FILES["uploaded_file"]["size"] < 1000000)) {
            $newname=_raid('10')."-".$filename;
            $newname = BASEPATH .DIRECTORY_SEPARATOR."assets/sms_file/".$newname;

            if (!file_exists($newname)) {

                if ((move_uploaded_file($_FILES['uploaded_file']['tmp_name'],$newname))) {

                    $sms = file_get_contents($newname);

                    $file_sms = str_replace(" ", "", $sms); #Remove any whitespace
                    $sms_result= trim($file_sms, "\r\n") ;
                    unlink($newname);
                } else {
                    exit ("An Error Occured");
                }
            } else {
                unlink($newname);
                exit ("File already exist with the same name");
            }

        }
        else { exit ("Invalid file type, Please go back and try again");}

    }

    $list = explode("\r\n", $sms_result);
    $listscount= count ($list) ;

    $sms_limit=ORM::for_table('accounts')->find_one($cid);
    $sms_count=$sms_limit['sms_limit'];

    $sms_cost=ORM::for_table('sms_gateway')->where('name',$gateway)->find_one();
    $sms_charge=$sms_cost['credit'];

    $total_charge=$sms_charge*$listscount;

    if($sms_count>=$total_charge){

        if($gateway=='NibsSMS'){

            for($i = 0; $i < $listscount; $i++){
                @$clphone.=$list[$i].';' ;
            }

            $clphone=substr($clphone,0,-1);


            $api_info=ORM::for_table('sms_gateway')->where('name',$gateway)->find_one();
            $api_count=ORM::for_table('sms_gateway')->where('name',$gateway)->where('status','Active')->count();

            if($api_count=='1'){
                $sms_url=$api_info['api_link'];
                $user=$api_info['username'];
                $password=$api_info['password'];
                $country_code=$api_info['api_id'];


                $sip = $_SERVER['REMOTE_ADDR'];

                $api_request="<REQUEST>
		                                <RETURNTYPE>json</RETURNTYPE>
			                                    <USER>
				                                        <LOGIN>$user</LOGIN>
				                                        <APIKEY>$password</APIKEY>
			                                    </USER>

			                                     <REQUESTPARAM>
				                                        <METHOD>sendOrScheduleSMS</METHOD>
                                                                <PARAMS>
                                                                    <MESSAGE>$message</MESSAGE>
                                                                    <COUNTRY_ID>$country_code</COUNTRY_ID>
                                                                    <SENDER_NAME>$sender_id</SENDER_NAME>
                                                                    <DATA_TYPE>numbers</DATA_TYPE>

                                                                    <PHONE_NUMBERS>
                                                                        <NUMBER>$clphone</NUMBER>
                                                                    </PHONE_NUMBERS>
                                                                </PARAMS>
                                       			 </REQUESTPARAM>
		                                </REQUEST>";

                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $sms_url);
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: text/xml;charset=utf-8', 'Content-length: '.strlen($api_request)));
                curl_setopt($ch, CURLOPT_POSTFIELDS, $api_request);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                $return = curl_exec($ch);
                curl_close($ch);

                $result=explode(",",$return);


                $get_sms_status=$result['1'];

                $search=array("DESCRIPTION",":",'}','"');
                $get_sms_status=trim(str_replace($search,"",$get_sms_status));
            }else{
                conf($self,'e','Selected Gateway is Not Active');
            }
        }



        if ($listscount> 0) {
            for($i = 0; $i < $listscount; $i++){
                $clphone = $list[$i] ;
                /*Api Integration Start Here*/


	/*For SSL Wireless Gateway*/
	if($gateway=='SSLWIRELESS'){


	    $api_info=ORM::for_table('sms_gateway')->where('name',$gateway)->find_one();
	    $api_count=ORM::for_table('sms_gateway')->where('name',$gateway)->where('status','Active')->count();

	    if($api_count=='1'){

		$clphone = str_replace(" ", "", $clphone); #Remove any whitespace
		$clphone = str_replace('+', '', $clphone);

                if ($clphone = _test_mobile_no($clphone)) {

			$sms_url=$api_info['api_link'];
			$user=$api_info['username'];
			$password=$api_info['password'];
			$api_id=$api_info['api_id'];


			//$user ="susanta@ssl";
			$pass = "myssl@123";
			$sid = "digicon";
			$url=$sms_url;
			$param="user=$user&pass=$password&sms[0][0]=".urlencode ( $clphone )."&sms[0][1]=".urlencode(html_entity_decode(html_entity_decode($message,ENT_QUOTES), ENT_QUOTES))."&sid=$api_id";
			$crl = curl_init();
			curl_setopt($crl,CURLOPT_SSL_VERIFYPEER,FALSE);
			curl_setopt($crl,CURLOPT_SSL_VERIFYHOST,2);
			curl_setopt($crl,CURLOPT_URL,$url);
			curl_setopt($crl,CURLOPT_HEADER,0);
			curl_setopt($crl,CURLOPT_RETURNTRANSFER,1);
			curl_setopt($crl,CURLOPT_POST,1);
			curl_setopt($crl,CURLOPT_POSTFIELDS,$param);
			$returns = curl_exec($crl);

			curl_close($crl);

			$respond_status = getTextBetweenTags($returns, 'LOGIN');
			$respond_message = getTextBetweenTags($returns, 'STAKEHOLDERID');
			$respond_reference = getTextBetweenTags($returns, 'REFERENCEID');

			if ($respond_status=='SUCCESSFULL') {
				$get_sms_status="Success";

			} else {

				$get_sms_status="Failed";
			}
                } else {

                        conf($self,'e','Invalid mobile number');
                }


	   }  else{
		conf($self,'e','Selected Gateway is Not Active');
	    }


	}


                /*For Twilio SMS Gateway*/


                if($gateway=='Twilio'){

                    $sender_id=urldecode($sender_id);
                    $message=urldecode($message);

                    $twilio_info=ORM::for_table('sms_gateway')->where('name',$gateway)->find_one();
                    $twilio_count=ORM::for_table('sms_gateway')->where('name',$gateway)->where('status','Active')->count();

                    $xstage=appconfig('appStage');

                    if($xstage!='Demo'){

                        if($twilio_count=='1'){


                            $sip = $_SERVER['REMOTE_ADDR'];

                            require_once('../lib/sms_gateway/twilio-php/Services/Twilio.php');
                            $account_sid=$twilio_info['username'];
                            $auth_token=$twilio_info['password'];



                            try{

                                $url = "https://api.twilio.com/2010-04-01/Accounts/$account_sid/SMS/Messages.json";

                                $data = array (
                                    'From' => $sender_id,
                                    'To' => $clphone,
                                    'Body' => $message,

                                );
                                $post = http_build_query($data);
                                $curl = curl_init($url);
                                curl_setopt($curl, CURLOPT_POST, true);
                                curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
                                curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
                                curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
                                curl_setopt($curl, CURLOPT_USERPWD, "$account_sid:$auth_token");
                                curl_setopt($curl, CURLOPT_POSTFIELDS, $post);
                                $response = curl_exec($curl);
                                curl_close($curl);

                                $result=explode(",",$response);
                                $get_sms_status=$result['1'];

                                $search=array("message",":",'"');

                                $get_sms_status=trim(str_replace($search,"",$get_sms_status));



                            }catch (Exception $e){
                                $get_sms_status="Unknown Error";
                            }


                        }
                        else{
                            conf($self,'e','Selected Gateway is Not Active');
                        }
                    }
                    else{
                        $get_sms_status='Not Send In demo Mode';
                    }
                }


                if($gateway=='TelAPI'){

                    $sender_id=urldecode($sender_id);
                    $message=urldecode($message);

                    $telapi_info=ORM::for_table('sms_gateway')->where('name',$gateway)->find_one();
                    $telapi_count=ORM::for_table('sms_gateway')->where('name',$gateway)->where('status','Active')->count();

                    $xstage=appconfig('appStage');

                    if($xstage!='Demo'){

                        if($telapi_count=='1'){


                            $sip = $_SERVER['REMOTE_ADDR'];


                            require_once('../lib/sms_gateway/telapi-php/library/TelApi.php');
                            $account_sid=$telapi_info['username'];
                            $auth_token=$telapi_info['password'];
                            try{

# Always use singleton design pattern
                                $telapi = TelApi::getInstance();

                                $sms_message = $telapi->create('sms_messages', array(
                                    'To'=> $sender_id,
                                    'From'=>$clphone,
                                    'Body'=> $message
                                ));

                                $sms_message->getResponse();
                                $get_sms_status=$sms_message->sid;

                            }catch (Exception $e){
                                $get_sms_status="Unknown Error";
                            }


                        }
                        else{
                            conf($self,'e','Selected Gateway is Not Active');
                        }
                    }
                    else{
                        $get_sms_status='Not Send In demo Mode';
                    }
                }
                /*For Clickatell SMS Gateway*/

                if($gateway=='Clickatell'){

                    $api_info=ORM::for_table('sms_gateway')->where('name',$gateway)->find_one();
                    $api_count=ORM::for_table('sms_gateway')->where('name',$gateway)->where('status','Active')->count();


                    if($api_count=='1'){


                        $sms_url=$api_info['api_link'];
                        $user=$api_info['username'];
                        $password=$api_info['password'];
                        $api_id=$api_info['api_id'];

                        $url = "$sms_url/http/auth?user=$user&password=$password&api_id=$api_id";

                        $ret = file($url);

                        $sess = explode(":",$ret[0]);
                        if ($sess[0] == "OK") {
                            $sess = explode(":",$ret[0]);
                            $sess_id = trim($sess[1]); // remove any whitespace
                            $url = "$sms_url/http/sendmsg?session_id=$sess_id&to=$clphone&text=$message";

                            // do sendmsg call
                            $ret = file($url);
                            $send = explode(":",$ret[0]);

                            if ($send[0] == "ID") {
                                $msg_id=$send[1];
                                $get_sms_status="Success";
                            } else {
                                $get_sms_status="Failed";
                            }
                        } else {
                            $get_sms_status=$ret[0];
                        }

                        $sip = $_SERVER['REMOTE_ADDR'];


                    }else{
                        conf($self,'e','Selected Gateway is Not Active');
                    }
                }




                /*For SMSKaufen SMS Gateway*/
                if($gateway=='SMSKaufen'){

                    $api_info=ORM::for_table('sms_gateway')->where('name',$gateway)->find_one();
                    $api_count=ORM::for_table('sms_gateway')->where('name',$gateway)->where('status','Active')->count();

                    if($api_count=='1'){


                        $clphone = str_replace(" ", "", $clphone); #Remove any whitespace
                        $clphone = str_replace('+', '', $clphone);



                        $sms_url=$api_info['api_link'];
                        $user=$api_info['username'];
                        $password=$api_info['password'];
                        $api_id=$api_info['api_id'];

                        $sms_sent_to_user = "$sms_url" . "?type=4" . "&id=$user" . "&pw=$password" ."&empfaenger=$clphone" . "&absender=$sender_id" . "&text=$message";
                        $get_sms_status=file_get_contents($sms_sent_to_user);


                        $sip = $_SERVER['REMOTE_ADDR'];
                        $get_sms_status = str_replace("100", "Success", $get_sms_status);
                        $get_sms_status = str_replace("101", "Success", $get_sms_status);
                        $get_sms_status = str_replace("111", "What IP blocked", $get_sms_status);
                        $get_sms_status = str_replace("112", "Incorrect login data", $get_sms_status);
                        $get_sms_status = str_replace("120", "Sender field is empty", $get_sms_status);
                        $get_sms_status = str_replace("121", "Gateway field is empty", $get_sms_status);
                        $get_sms_status = str_replace("122", "Text is empty", $get_sms_status);
                        $get_sms_status = str_replace("123", "Recipient field is empty", $get_sms_status);
                        $get_sms_status = str_replace("129", "Wrong sender", $get_sms_status);
                        $get_sms_status = str_replace("130", "Gateway Error", $get_sms_status);
                        $get_sms_status = str_replace("131", "Wrong number", $get_sms_status);
                        $get_sms_status = str_replace("132", "Mobile phone is off", $get_sms_status);
                        $get_sms_status = str_replace("133", "Query not possible", $get_sms_status);
                        $get_sms_status = str_replace("134", "Number invalid", $get_sms_status);
                        $get_sms_status = str_replace("140", "No credit", $get_sms_status);
                        $get_sms_status = str_replace("150", "SMS blocked", $get_sms_status);
                        $get_sms_status = str_replace("170", "Date wrong", $get_sms_status);
                        $get_sms_status = str_replace("171", "Date too old", $get_sms_status);
                        $get_sms_status = str_replace("172", "Too many numbers", $get_sms_status);
                        $get_sms_status = str_replace("173", "Format wrong", $get_sms_status);
                        $get_sms_status = str_replace(",", " ", $get_sms_status);
                    }
                    else{
                        conf($self,'e','Selected Gateway is Not Active');
                    }


                }




                /*For Route SMS Gateway*/
                if($gateway=='Route SMS'){

                    $clphone = str_replace(" ", "", $clphone); #Remove any whitespace
                    $clphone = str_replace('+', '', $clphone);

                    $api_info=ORM::for_table('sms_gateway')->where('name',$gateway)->find_one();
                    $api_count=ORM::for_table('sms_gateway')->where('name',$gateway)->where('status','Active')->count();

                    if($api_count=='1'){
                        $xstage=appconfig('appStage');

                        if($xstage!='Demo'){

                            $sms_url=$api_info['api_link'];
                            $user=$api_info['username'];
                            $password=$api_info['password'];

                            $sms_sent_to_user = "$sms_url" . "?type=0" . "&username=$user" . "&password=$password" ."&destination=$clphone" . "&source=$sender_id" . "&message=$message" . "&dlr=1";
                            $get_sms_status=file_get_contents($sms_sent_to_user);
                            $sip = $_SERVER['REMOTE_ADDR'];
                            $get_sms_status = str_replace("1701", "Success", $get_sms_status);
                            $get_sms_status = str_replace("1709", "User Validation Failed", $get_sms_status);
                            $get_sms_status = str_replace("1025", "Insufficient Credit", $get_sms_status);
                            $get_sms_status = str_replace("1710", "Internal Error", $get_sms_status);
                            $get_sms_status = str_replace("1706", "Invalid receiver", $get_sms_status);
                            $get_sms_status = str_replace("1705", "Invalid SMS", $get_sms_status);
                            $get_sms_status = str_replace("1707", "Invalid sender", $get_sms_status);
                            $get_sms_status = str_replace(",", " ", $get_sms_status);

                        }
                        else{
                            $get_sms_status='Not Send In demo Mode';
                        }


                    }
                    else{
                        conf($self,'e','Selected Gateway is Not Active');
                    }

                }


                /*For SMSGlobal SMS Gateway*/
                if($gateway=='SMSGlobal'){

                    $clphone = str_replace(" ", "", $clphone); #Remove any whitespace
                    $clphone = str_replace('+', '', $clphone);

                    $api_info=ORM::for_table('sms_gateway')->where('name',$gateway)->find_one();

                    $api_count=ORM::for_table('sms_gateway')->where('name',$gateway)->where('status','Active')->count();

                    if($api_count=='1'){
                        $sms_url=$api_info['api_link'];
                        $user=$api_info['username'];
                        $password=$api_info['password'];

                        $sms_sent_to_user = "$sms_url" . "?action=sendsms" . "&user=$user" . "&password=$password" ."&from=$sender_id" . "&to=$clphone" . "&text=$message" . "&api=1";

                        $get_sms_status=file_get_contents($sms_sent_to_user);
                        $get_sms_status = preg_replace("/[^0-9]/", '', $get_sms_status);

                        $sip = $_SERVER['REMOTE_ADDR'];
                        $get_sms_status = str_replace("88", "Not enough credits", $get_sms_status);
                        $get_sms_status = str_replace("99", "Unknown error", $get_sms_status);
                        $get_sms_status = str_replace("100", "Incorrect username/password", $get_sms_status);
                        $get_sms_status = str_replace("300", "Missing MSISDN", $get_sms_status);
                        $get_sms_status = str_replace("750", "Invalid MSISDN", $get_sms_status);
                    }
                    else{
                        conf($self,'e','Selected Gateway is Not Active');
                    }

                }



                /*For Nexmo SMS Gateway*/
                if($gateway=='Nexmo'){

                    $clphone = str_replace(" ", "", $clphone); #Remove any whitespace
                    $clphone = str_replace('+', '', $clphone);

                    $api_info=ORM::for_table('sms_gateway')->where('name',$gateway)->find_one();

                    $api_count=ORM::for_table('sms_gateway')->where('name',$gateway)->where('status','Active')->count();

                    if($api_count=='1'){


                        $sms_url=$api_info['api_link'];
                        $user=$api_info['username'];
                        $password=$api_info['password'];

                        $sms_sent_to_user = "$sms_url" . "?api_key=$user" . "&api_secret=$password" ."&from=$sender_id" . "&to=$clphone" . "&text=$message";

                        $get_sms_status=file_get_contents($sms_sent_to_user);

                        if (strpos($get_sms_status,'<status>0</status>') !== false) {
                            $get_sms_status='Success';
                        }elseif(strpos($get_sms_status,'<status>1</status>') !== false){
                            $get_sms_status='Throttled';
                        }elseif(strpos($get_sms_status,'<status>2</status>') !== false){
                            $get_sms_status='Missing params';
                        }elseif(strpos($get_sms_status,'<status>3</status>') !== false){
                            $get_sms_status='Invalid params';
                        }elseif(strpos($get_sms_status,'<status>4</status>') !== false){
                            $get_sms_status='Invalid credentials';
                        }elseif(strpos($get_sms_status,'<status>5</status>') !== false){
                            $get_sms_status='Internal error';
                        }elseif(strpos($get_sms_status,'<status>6</status>') !== false){
                            $get_sms_status='Invalid message';
                        }elseif(strpos($get_sms_status,'<status>7</status>') !== false){
                            $get_sms_status='Number barred';
                        }elseif(strpos($get_sms_status,'<status>8</status>') !== false){
                            $get_sms_status='Partner account barred';
                        }elseif(strpos($get_sms_status,'<status>9</status>') !== false){
                            $get_sms_status='Partner quota exceeded';
                        }elseif(strpos($get_sms_status,'<status>11</status>') !== false){
                            $get_sms_status='Account not enabled for REST';
                        }elseif(strpos($get_sms_status,'<status>12</status>') !== false){
                            $get_sms_status='Message too long';
                        }elseif(strpos($get_sms_status,'<status>13</status>') !== false){
                            $get_sms_status='Communication Failed';
                        }elseif(strpos($get_sms_status,'<status>14</status>') !== false){
                            $get_sms_status='Invalid Signature';
                        }elseif(strpos($get_sms_status,'<status>15</status>') !== false){
                            $get_sms_status='Invalid sender address';
                        }elseif(strpos($get_sms_status,'<status>16</status>') !== false){
                            $get_sms_status='Invalid TTL';
                        }elseif(strpos($get_sms_status,'<status>19</status>') !== false){
                            $get_sms_status='Facility not allowed';
                        }elseif(strpos($get_sms_status,'<status>20</status>') !== false){
                            $get_sms_status='Invalid Message class';
                        }else{
                            $get_sms_status='Unknown Error';
                        }

                        $sip = $_SERVER['REMOTE_ADDR'];
                    }else{
                        conf($self,'e','Selected Gateway is Not Active');
                    }
                }





                /*For Kapow SMS Gateway*/

                if($gateway=='Kapow'){

                    $api_info=ORM::for_table('sms_gateway')->where('name',$gateway)->find_one();

                    $api_count=ORM::for_table('sms_gateway')->where('name',$gateway)->where('status','Active')->count();

                    if($api_count=='1'){
                        $sms_url=$api_info['api_link'];
                        $user=$api_info['username'];
                        $password=$api_info['password'];

                        $posturl = "$sms_url" . "?username=$user" . "&password=$password" ."&mobile=$clphone" . "&sms=$message";

                        // check if non-compulsory items are in use, add to string if so
                        if($sender_id!=''){
                            $posturl.='&from_id='.$sender_id;
                        }


                        // attempt to post message
                        $handle=fopen($posturl,'r') or die('Unable to open URL');
                        $response=stream_get_contents($handle);

                        // return reponse
                        if(strstr($response,'OK')){
                            $get_sms_status="Success";
                        }
                        if($response=='USERPASS'){
                            $get_sms_status="Your credentials are incorrect";
                        }

                        if($response=='ERROR'){
                            $get_sms_status="Error";
                        }
                        if($response=='NOCREDIT')
                            $get_sms_status="You have no credits remaining";
                    }else{
                        conf($self,'e','Selected Gateway is Not Active');
                    }

                    $sip = $_SERVER['REMOTE_ADDR'];

                }


                if($gateway=='InfoBip'){

                    $sender_id=urlencode($sender_id);
                    $message=urlencode($message);
                    $clphone=urlencode($clphone);

                    $infobip_info=ORM::for_table('sms_gateway')->where('name',$gateway)->find_one();
                    $infobip_count=ORM::for_table('sms_gateway')->where('name',$gateway)->where('status','Active')->count();

                    $xstage=appconfig('appStage');

                    if($infobip_count=='1'){
                        $sip = $_SERVER['REMOTE_ADDR'];
                        $sms_url=$infobip_info['api_link'];
                        $username=$infobip_info['username'];
                        $password=$infobip_info['password'];

                        $sms_sent_to_user = "$sms_url" . "?user=$username" . "&password=$password" ."&sender=$sender_id" . "&GSM=$clphone" . "&SMSText=$message"."&datacoding=8";

                        $get_sms_status=file_get_contents($sms_sent_to_user);

                        if (strpos($get_sms_status,'<status>0</status>') !== false) {
                            $get_sms_status='Success';
                        }elseif(strpos($get_sms_status,'<status>-1</status>') !== false){
                            $get_sms_status='Error in processing the request';
                        }elseif(strpos($get_sms_status,'<status>-2</status>') !== false){
                            $get_sms_status='Not enough credits on a specific account';
                        }elseif(strpos($get_sms_status,'<status>-3</status>') !== false){
                            $get_sms_status='Targeted network is not covered on specific account';
                        }elseif(strpos($get_sms_status,'<status>-5</status>') !== false){
                            $get_sms_status='Username or password is invalid';
                        }elseif(strpos($get_sms_status,'<status>-6</status>') !== false){
                            $get_sms_status='Destination address is missing in the request';
                        }elseif(strpos($get_sms_status,'<status>-10</status>') !== false){
                            $get_sms_status='Username is missing in the request';
                        }elseif(strpos($get_sms_status,'<status>-11</status>') !== false){
                            $get_sms_status='Password is missing in the request';
                        }elseif(strpos($get_sms_status,'<status>-13</status>') !== false){
                            $get_sms_status='Number is not recognized by Infobip platform';
                        }elseif(strpos($get_sms_status,'<status>-22</status>') !== false){
                            $get_sms_status='Incorrect XML format, caused by syntax error';
                        }elseif(strpos($get_sms_status,'<status>-23</status>') !== false){
                            $get_sms_status='General error, reasons may vary';
                        }elseif(strpos($get_sms_status,'<status>-26</status>') !== false){
                            $get_sms_status='General API error, reasons may vary';
                        }elseif(strpos($get_sms_status,'<status>-27</status>') !== false){
                            $get_sms_status='Invalid scheduling parametar';
                        }elseif(strpos($get_sms_status,'<status>-28</status>') !== false){
                            $get_sms_status='Invalid PushURL in the request';
                        }elseif(strpos($get_sms_status,'<status>-30</status>') !== false){
                            $get_sms_status='Invalid APPID in the request';
                        }elseif(strpos($get_sms_status,'<status>-33</status>') !== false){
                            $get_sms_status='Duplicated MessageID in the request';
                        }elseif(strpos($get_sms_status,'<status>-34</status>') !== false){
                            $get_sms_status='Sender name is not allowed';
                        }elseif(strpos($get_sms_status,'<status>-99</status>') !== false){
                            $get_sms_status='Error in processing request, reasons may vary';
                        }else{
                            $get_sms_status='Unknown Error';
                        }
                    }
                    else{
                        conf($self.'?_clid='.$cmd,'e','Selected Gateway is Not Active');
                    }

                }



            }


        }
    }else{
        conf('send-sms-from-file.php','e','You Do Not Have Enough Balance to sent this SMS');
    }

    for($i = 0; $i < $listscount; $i++){
        $client_phone = $list[$i] ;
        $sip = $_SERVER['REMOTE_ADDR'];
        $isms=ORM::for_table('sms_history')->create();
        $isms->userid=$cid;
        $isms->sender=$sender_id;
        $isms->receiver=$client_phone;
        $isms->amount=$msgcount;
        $isms->sms=$message;
        $isms->ip=$sip;
        $isms->report=$get_sms_status;
        $isms->save();
    }


    $remain_sms=$sms_count-$total_charge;

    $query = "UPDATE accounts SET sms_limit='$remain_sms' WHERE id='$cid'";
    $stmt = $dbh->prepare($query);
    $stmt->execute();


    conf('sms-history.php','s','SMS Send Successfully');

    }


else{
          conf($self,'e','Please Enter Information Again');

}


?>

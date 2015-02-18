<?php
require 'initapp.php';
$self='send-email.php';


if (isset($_POST['submit'])){

    $email=_post('email');
    $subject=_post('subject');
    $message=$_POST['message'];

    if($email==''){
        conf($self,'e','Please Insert Email Address');
    }
    if($subject==''){
        conf($self,'e','Please Insert Email Subject');
    }
    if($message==''){
        conf($self,'e','Please Insert Email Message');
    }

    $email_provider=_post('email_provider');


    $query = "SELECT * FROM accounts WHERE id='$cid'";
    $stmt = $dbh->prepare($query);
    $stmt->execute();
    $clresult = $stmt->fetch();

    $email_count=$clresult['email_limit'];



    if($email_count>0){

    if ($stmt->rowCount() > 0) {
        $sysEmail=$clresult['email'];
        $sysCompany=$clresult['name'].' '.$clresult['lname'];

        if($email_provider=='default'){
        require ('../lib/pnp/email/class.phpmailer.php') ;
        $mail = new PHPMailer();
        $mail->SetFrom($sysEmail, $sysCompany);
        $mail->AddReplyTo($sysEmail, $sysCompany);
        $mail->AddAddress($email, $email);
        $mail->Subject    = $subject;
        $mail->MsgHTML($message);
        $mail->Send();
        }elseif($email_provider=='PHPMailer'){

            require ('../lib/email_provider/PHPMailer/PHPMailerAutoload.php');

            $pmq=ORM::for_table('email_providers')->where('name',$email_provider)->find_one();
            $status_check=ORM::for_table('email_providers')->where('name',$email_provider)->where('status','1')->count();

            if($status_check=='1'){

                $host_name=$pmq['host_name'];
                $username=$pmq['username'];
                $password=$pmq['password'];
                $port=$pmq['port'];

                $mail = new PHPMailer;
                $mail->isSMTP();                                      // Set mailer to use SMTP
                $mail->Host = "$host_name";  // Specify main and backup SMTP servers
                $mail->SMTPAuth = true;                               // Enable SMTP authentication
                $mail->Username = "$username";                 // SMTP username
                $mail->Password ="$password";                           // SMTP password
                $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
                $mail->Port = "$port";                                    // TCP port to connect to

                $mail->SetFrom($sysEmail, $sysCompany);
                $mail->AddReplyTo($sysEmail, $sysCompany);
                $mail->AddAddress($email, $subject);
                $mail->Subject    = $subject;
                $mail->MsgHTML($message);
                $shamim=$mail->Send();

            }else{
                conf($self,'e','Selected Email Provider is Not Active');
            }
        }

        elseif($email_provider=='MailGun'){

            require ('../lib/email_provider/PHPMailer/PHPMailerAutoload.php');

            $pmq=ORM::for_table('email_providers')->where('name',$email_provider)->find_one();
            $status_check=ORM::for_table('email_providers')->where('name',$email_provider)->where('status','1')->count();

            if($status_check=='1'){

                $host_name=$pmq['host_name'];
                $username=$pmq['username'];
                $password=$pmq['password'];
                $port=$pmq['port'];

                $mail = new PHPMailer;
                $mail->isSMTP();                                      // Set mailer to use SMTP
                $mail->Host = "$host_name";  // Specify main and backup SMTP servers
                $mail->SMTPAuth = true;                               // Enable SMTP authentication
                $mail->Username = "$username";                 // SMTP username
                $mail->Password ="$password";                           // SMTP password
                if($port=='465'){
                    $mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `tls` also accepted
                }else{
                    $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
                }
                $mail->Port = "$port";
                $mail->From = "$sysEmail";
                $mail->FromName = "$sysCompany";
                $email = $clresult['email'];
                $name = $clresult['name'];
                $mail->AddAddress($email);
                $mail->Subject    = $mail_subject;
                $mail->MsgHTML($message);
                $mail->Send();
            }else{
                conf($self,'e','Selected Email Provider is Not Active');
            }
        }

        elseif($email_provider=='SendGrid'){
            require ('../lib/email_provider/sendgrid-php/sendgrid-php.php');

            $pmq=ORM::for_table('email_providers')->where('name',$email_provider)->find_one();
            $status_check=ORM::for_table('email_providers')->where('name',$email_provider)->where('status','1')->count();
            if($status_check=='1'){
                $host_name=$pmq['host_name'];
                $username=$pmq['username'];
                $password=$pmq['password'];
                $port=$pmq['port'];


                $options = array(
                    'turn_off_ssl_verification' => true,
                    'protocol' => 'https',
                    'host' => 'api.sendgrid.com',
                    'endpoint' => '/api/mail.send.json',
                    'url' => null
                );
                $sendgrid = new SendGrid($username, $password, $options);

                $cl_email   = new SendGrid\Email();
                $cl_email->setFrom($sysEmail);
                $cl_email->setFromName($sysCompany);
                $cl_email->addTo($email);
                $cl_email->setSubject($subject);
                $cl_email->setText($message);
                $sendgrid->send($cl_email);

            }else{
                conf($self,'e','Selected Email Provider is Not Active');
            }

        }else{
            conf($self,'e','Please Select a Provider');
        }


    $imail=ORM::for_table('email_logs')->create();
    $imail->userid=$cid;
    $imail->email=$email;
    $imail->subject=$subject;
    $imail->message=$message;
    $imail->save();


    }


        $remain_email=$email_count-1;

        $query = "UPDATE accounts SET email_limit='$remain_email' WHERE id='$cid'";
        $stmt = $dbh->prepare($query);
        $stmt->execute();

    conf($self,'s','Email Send Successfully');
    }else{
        conf($self,'e','You Do Not Have Enough Balance to sent this Email');
    }
    }


else{
    conf($self,'e','Please Enter Information Again');

}


?>
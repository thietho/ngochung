<?php
final class HelperPHPMailer {
    static public function sendEmail($from = 'elifepartners.com@gmail.com', $to, $name, $subject, $altBody = "", $body, $replyTo = "")
    {

        $arrFrom = array_map('trim', explode(';', $from));
        $array_receive = array_map('trim', explode(';', $to));
        $arrRelyTo = array_map('trim', explode(';', $replyTo));

        $mail = new PHPMailer();
        $mail->CharSet = "utf-8";
        $mail->isMail();
        if (count($arrFrom) > 0) {
            $mail->setFrom($arrFrom[0], $name);
        } else {
            $mail->setFrom('elifepartners.com@gmail.com', $name);
        }

        if (count($arrRelyTo) > 0) {
            foreach($arrRelyTo as $replyEmail) {
                $mail->addReplyTo($replyEmail);
            }
        }

        $mail->Subject = $subject;
        $mail->msgHTML($body);
        $mail->AltBody = $altBody;

        if(count($array_receive) > 0) {
            foreach($array_receive as $receive) {
                $mail->addAddress($receive, '');
            }
        }

        //$mail->addCC('ngoctancnpm1@gmail.com', 'Tan');
        //$mail->addBCC('edwintuanpham@gmail.com', '');
        if (!$mail->send()) {
            return false;
        } else {
            return true;
        }

    }
}
<?php
function getTextBetweenTags($string, $tagname) {
        $pattern = "/<$tagname ?.*>(.*)<\/$tagname>/";
        preg_match($pattern, $string, $matches);
        return $matches[1];
}


# MOBILE NUMBER CHECK
function CheckNumber($msisdn) {
        $regexp = "/^(88|)01[1,5,6,7,8,9]{1}[0-9]{8}$/";
        if(preg_match($regexp, $msisdn)) return true;
        return false;
}

function _test_mobile_no($mobile_no = ""){
        $mobile_no = trim($mobile_no);

        if(strlen($mobile_no)=='11') {
                if(CheckNumber($mobile_no)) {           # CHECK WHETHER ALL BANGLADESHI NUMBER  
                        return "88" . $mobile_no;

                } else return false;
        } else if(strlen($mobile_no)>'11') {    # ALREADYND ADDED 88 OR ABROAD SMS 
                if(is_numeric($mobile_no)) {            # CHECK ALL ARE NUMBER
                        return $mobile_no;

                } else return false;

        } else {
                return false;   # ELSE INVALID NUMBER
        }
}


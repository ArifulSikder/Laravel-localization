<?php 
use Illuminate\Support\Facades\App;
use App\Models\Translate;
use Illuminate\Support\Facades\Cache;
function translate($key, $lang = null, $addslashes = false)
{

    
    if ($lang == null) {
        $lang = App::getLocale();
    }
    
    $lang_key = preg_replace('/[^A-Za-z0-9\_]/', '', str_replace(' ', '_', strtolower($key)));

    
    $translations_en = Cache::rememberForever('translations-en', function () {
        return Translate::where('lang', 'en')->pluck('lang_value', 'lang_key')->toArray();
    });
    if (!isset($translations_en[$lang_key])) {
        $translate_default = new Translate;
        $translate_default->lang = 'en';
        $translate_default->lang_key = $lang_key;
        $translate_default->lang_value = str_replace(array("\r", "\n", "\r\n"), "", $key);
        $translate_default->save();
        Cache::forget('translations-en');
    }
    
    // return user session lang
    $translation_locale = Cache::rememberForever("translations-{$lang}", function () use ($lang) {
        return Translate::where('lang', $lang)->pluck('lang_value', 'lang_key')->toArray();
    });
    if (isset($translation_locale[$lang_key])) {
        return 
       $addslashes ? addslashes(trim($translation_locale[$lang_key])) : trim($translation_locale[$lang_key]);
    }
    else{
        return  $addslashes ? addslashes(trim($translations_en[$lang_key])) : trim($translations_en[$lang_key]);
    }

    // dd($translate);
    // return $translate;
    // return __('message.'.$key);
}


?>
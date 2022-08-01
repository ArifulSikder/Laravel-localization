<?php

namespace App\Http\Controllers;

use App\Models\Language;
use App\Models\Translate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Cache;
class LocalizationController extends Controller
{
    public function lang_change(Request $request)
    {
        App::setLocale('en');
        if($request->lang){
            App::setLocale($request->lang);
            session()->put('locale', $request->lang);
        }  
        $language1 = Language::where('code', app()->getLocale())->first();
        $lang_keys = Translate::where('lang', 'en')->paginate(20);
     
        return view('welcome',compact('language1','lang_keys'));
        
    }

    public function language_add(Request $request){
        $input = $request->all();
        $input['rtl'] = 1;
        $input['status'] = 1;
        Language::create($input);
        
        Cache::forget('app.languages');
        return 'ok';
    }

    function languages_key_value_store(Request $request){
        $language = Language::findOrFail($request->id);  
        foreach ($request->values as $key => $value) {
            $translation_def = Translate::where('lang_key', $key)->where('lang', $language->code)->latest()->first();
            if($translation_def == null){
                $translation_def = new Translate;
                $translation_def->lang = $language->code;
                $translation_def->lang_key = $key;
                $translation_def->lang_value = $value;
                $translation_def->save();
            }
            else {
                $translation_def->lang_value = $value;
                $translation_def->save();
            }
        }
        
        Cache::forget('translations-'.$language->code);
        return back();
    }
}

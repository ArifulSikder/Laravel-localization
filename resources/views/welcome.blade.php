<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ translate('Wake Up Ict') }}</title>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <style type="text/css">
        #map,
        #mappp {
            height: 700px;
            width: 700px;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <div class="container mt-5">
        <div class="col-md-2 col-md-offset-3 text-right">
            <strong>Select Language: </strong>
        </div>
        <div class="col-md-4">
            <select class="form-control Langchange">
                @foreach (\App\Models\Language::get() as $language)
                    <option value="{{ $language->app_lang_code }}"
                        {{ session()->get('locale') == $language->app_lang_code ? 'selected' : '' }}>
                        {{ $language->name }}</option>
                @endforeach
                {{-- <option value="bn" {{ session()->get('locale') == 'bn' ? 'selected' : '' }}>Bangla</option> --}}
            </select>
        </div>
        {{-- <h1 style="margin-top: 80px;">{{ __('message.welcome') }}</h1> --}}
        <h1 style="margin-top: 80px;">{{ translate('welcome') }}</h1>
        {{-- <div id="mappp"></div> --}}

        <p>{{ translate('My name is Noyon') }}</p>
        <div class="row">
            <div class="col-md-6">
                <form action="{{ route('language_add') }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label for="name">{{ translate('Name') }}</label>
                        <input type="text" class="form-control" name="name"
                            placeholder="{{ translate('Enter Name') }}">
                    </div>
                    <div class="form-group">
                        <label for="code">code</label>
                        <input type="text" class="form-control" name="code" placeholder="Enter Code">
                    </div>
                    <div class="form-group">
                        <label for="app_lang_code">{{ translate('app_lang_code') }}</label>
                        <input type="text" class="form-control" name="{{ translate('app_lang_code') }}"
                            placeholder="Enter app_lang_code">
                    </div>
                    <button type="submit" class="btn btn-primary">{{ translate('Submit') }}</button>
                </form>
            </div>
            <div class="col-md-6">

                <form class="form-horizontal" action="{{ route('languages_key_value_store') }}" method="POST">
                    @csrf
                    <input type="hidden" name="id" value="{{ $language1->id }}">
                    <div class="card-body">
                        <table class="table table-striped table-bordered demo-dt-basic" id="tranlation-table"
                            cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th width="45%">{{ translate('Key') }}</th>
                                    <th width="45%">{{ translate('Value') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($lang_keys as $key => $translation)
                                    {{-- {{ dd($translation->lang_key) }} --}}
                                    <tr>
                                        <td>{{ $key + 1 + ($lang_keys->currentPage() - 1) * $lang_keys->perPage() }}
                                        </td>
                                        <td class="key">{{ $translation->lang_value }}</td>
                                        <td>
                                            <input type="text" class="form-control value" style="width:100%"
                                                name="values[{{ $translation->lang_key }}]"
                                                @if (($traslate_lang = \App\Models\Translate::where('lang', app()->getLocale())->where('lang_key', $translation->lang_key)->latest()->first()) != null) value="{{ $traslate_lang->lang_value }}" @endif>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="aiz-pagination">
                            {{ $lang_keys->appends(request()->input())->links() }}
                        </div>

                        <div class="form-group mb-0 text-right">
                            <button type="button" class="btn btn-primary"
                                onclick="copyTranslation()">{{ translate('Copy Translations') }}</button>
                            <button type="submit" class="btn btn-primary">{{ translate('Save') }}</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-6">

                <div class="card-body">
                    <form class="form-horizontal" action="{{ route('languages_store') }}" method="POST"
                        enctype="multipart/form-data">
                        @csrf
                        <div class="form-group row">
                            <div class="col-lg-3">
                                <label class="col-from-label">{{ translate('Name') }}</label>
                            </div>
                            <div class="col-lg-9">
                                <input type="text" class="form-control" name="name"
                                    placeholder="{{ translate('Name') }}" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-3">
                                <label class="col-from-label">{{ translate('Code') }}</label>
                            </div>
                            <div class="col-lg-9">
                                @php
                                    $languagesArray = \App\Models\Language::pluck('code')->toarray();
                                    foreach (\File::files(base_path('public/flags')) as $path) {
                                        // dd();
                                    }
                                @endphp
                                <select class="form-control aiz-selectpicker mb-2 mb-md-0" name="code"
                                    data-live-search="true">
                                    @foreach (\File::files(base_path('public/flags')) as $path)
                                        @if (!in_array(pathinfo($path)['filename'], $languagesArray))
                                            <option value="{{ pathinfo($path)['filename'] }}"
                                                data-content="<div class=''><img src='{{ asset('flags/' . pathinfo($path)['filename'] . '.png') }}' class='mr-2'><span>{{ strtoupper(pathinfo($path)['filename']) }}</span></div>">
                                            </option>
                                        @endif
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-3">
                                <label class="control-label">{{ translate('Flutter App Lang Code') }}</label>
                                <code><a target="_blank"
                                        href="https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes">{{ translate('Links for ISO 639-1 codes') }}</a></code>
                            </div>
                            <div class="col-lg-9">
                                <input type="text" class="form-control" name="app_lang_code"
                                    placeholder="{{ translate('Put ISO 639-1 code for your language') }}" required>
                            </div>
                        </div>
                        <div class="form-group mb-0 text-right">
                            <button type="submit" class="btn btn-sm btn-primary">{{ translate('Save') }}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        @php
            $lat = 24.8998;
            $lng = 91.8664;
            cache(['key' => $lng], 120);
        @endphp
        <div id="map"></div>
        <iframe src="http://maps.google.com/maps?q={{ $lat }},{{ $lng }}&z=16&output=embed"
            height="450" width="600"></iframe>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>
    <script></script>
    <script type="text/javascript">
        function initMap() {
            const myLatLng = {
                lat: 24.8998,
                lng: 91.8664
            };
            const map = new google.maps.Map(document.getElementById("map"), {
                zoom: 10,
                center: myLatLng,
            });

            new google.maps.Marker({
                position: myLatLng,
                map,
                title: "Hello Dhaka!",
            });
        }

        window.initMap = initMap;
    </script>

    {{-- <script type="text/javascript"
        src="https://maps.google.com/maps/api/js?key={{ env('GOOGLE_MAP_KEY') }}&callback=initMap"></script> --}}
    <script>
        $(document).ready(function() {
            const position = {
                lat: 24.8998,
                lng: 91.8664
            }

            const map = new google.maps.Map(document.getElementById('mappp'), {
                zoom: 10,
                center: position
            });
            new google.maps.Marker({
                position: position,
                map: map,
            });
        });
    </script>
    <script type="text/javascript">
        var url = "{{ route('LangChange') }}";
        $(".Langchange").change(function() {
            window.location.href = url + "?lang=" + $(this).val();
        });
    </script>
</body>

</html>

<?php

namespace App\Exceptions;

use Throwable;
use Symfony\Component\Mailer\Exception\TransportException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array
     */
    protected $dontFlash = [
        'password',
        'password_confirmation',
    ];

    /**
     * Report or log an exception.
     *
     * @param  \Throwable  $exception
     * @return void
     *
     * @throws \Exception
     */
    public function report(Throwable $exception)
    {
        parent::report($exception);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Throwable  $exception
     * @return \Symfony\Component\HttpFoundation\Response
     *
     * @throws \Throwable
     */
    public function render($request, Throwable $e) {
		if ($e instanceof TransportException) {
			if ($request->ajax()) {
				return response()->json(['result' => 'error', 'message' => 'SMTP Configuration is incorrect !']);
			} else {
				return redirect()->route('login')->with('error', 'SMTP Configuration is incorrect !');
			}
		}

		return parent::render($request, $e);
	}
}

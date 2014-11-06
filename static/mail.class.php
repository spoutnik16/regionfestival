<?php
namespace Library;

require_once('Swiftmailer/swift_required.php');

class Mail extends ApplicationComponent
{
	private $mailer,
		$transport;
	
	public function __construct($app)
	{
		require_once('Swiftmailer/swift_required.php');
		$this->transport = \Swift_SmtpTransport::newInstance(SMTP_ADDRESS, 465, 'ssl')
			->setUsername(SMTP_USERNAME)
			->setPassword(SMTP_PASSWORD);
		$this->mailer = \Swift_Mailer::newInstance($this->transport);
		parent::__construct($app);
	}
	
	public function getInstance()
	{
		return \Swift_Message::newInstance();
	}
	
	public function send($message)
	{
		return $this->mailer->send($message);
	}
}
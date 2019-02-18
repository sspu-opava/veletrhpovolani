<?php

namespace App\Forms;

use App\Model;
use Nette;
use Nette\Application\UI\Form;


final class SignUpFormFactory
{
	use Nette\SmartObject;

	const PASSWORD_MIN_LENGTH = 7;

	/** @var FormFactory */
	private $factory;

	/** @var Model\UserManager */
	private $userManager;


	public function __construct(FormFactory $factory, Model\UserManager $userManager)
	{
		$this->factory = $factory;
		$this->userManager = $userManager;
	}


	/**
	 * @return Form
	 */
	public function create(callable $onSuccess)
	{
		$form = $this->factory->create();
		$form->addText('username', 'Uživatelské jméno')
			->setRequired('Zadejte, prosím, uživatelské jméno.');

		$form->addEmail('email', 'E-mail')
			->setRequired('Zadejte, prosím, e-mail.');

		$form->addPassword('password', 'Heslo')
			->setOption('description', sprintf('nejméně %d znaků', self::PASSWORD_MIN_LENGTH))
			->setRequired('Vložte, prosím, heslo')
			->addRule($form::MIN_LENGTH, null, self::PASSWORD_MIN_LENGTH);

		$form->addSubmit('send', 'Zaregistrovat');

		$form->onSuccess[] = function (Form $form, $values) use ($onSuccess) {
			try {
				$this->userManager->add($values->username, $values->email, $values->password);
			} catch (Model\DuplicateNameException $e) {
				$form['username']->addError('Uživatelské jméno už existuje.');
				return;
			}
			$onSuccess();
		};

		return $form;
	}
}

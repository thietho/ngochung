<?php

final class Front
{
    private $pre_action = array();
    private $error;

    public function __construct()
    {

    }

    public function addPreAction($pre_action)
    {
        $this->pre_action[] = $pre_action;
    }

    public function dispatch($action, $error)
    {
        $this->error = $error;

        foreach ($this->pre_action as $pre_action) {

            $result = $this->execute($pre_action);

            if ($result) {
                $action = $result;

                break;
            }
        }

        while ($action) {
            $action = $this->execute($action);
        }
    }

    private function execute($action)
    {

        $result = $action->execute();

        if (is_object($result)) {

            $action = $result;

        } elseif ($result === false) {

            $action = $this->error;
            $this->error = '';

        } else {

            $action = false;
        }

        return $action;
    }
}
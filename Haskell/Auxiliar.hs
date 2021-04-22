module Auxiliar where

import qualified Vacina
import qualified Paciente
import Data.Map as Map (fromList, Map)
import Data.List
import Data.List.Split (splitOn)
import System.IO as Strict ( readFile )

criaArquivos :: IO()
criaArquivos = do
    appendFile "dados/pacientes.txt" ("")
    appendFile "dados/vacinas.txt" ("")
   
iniciaVacina:: IO[Vacina.Vacina]
iniciaVacina = do
    arquivo <- Strict.readFile "dados/vacinas.txt"
    let lista = map (splitOn ",") (lines arquivo)
    let lista_vacina = Data.List.map constroiVacina lista
    return lista_vacina

iniciaPaciente:: IO[Paciente.Paciente ]
iniciaPaciente = do
    arquivo <- Strict.readFile "dados/pacientes.txt"
    let lista = map (splitOn ",") (lines arquivo)
    let lista_paciente = Data.List.map constroiPaciente lista
    return lista_paciente

escreverVacina:: Vacina.Vacina -> IO()
escreverVacina vacina = do
    let vacinaStr = Vacina.nome vacina ++ "," ++ show (Vacina.dataFabricacao vacina) ++ "," ++ show (Vacina.dataValidade vacina) ++ "," ++ Vacina.laboratorio vacina ++ "," ++ show (Vacina.estoque vacina) ++ "," ++ show (Vacina.quantidadeDosesNecessarias vacina) ++ "," ++ Vacina.enfermidade vacina ++ "," ++ show (Vacina.taxaEficiencia vacina) ++ "," ++ Vacina.seloAprovacao vacina ++ "," ++ Vacina.paisOrigem vacina ++ "\n"
    appendFile "dados/vacinas.txt" vacinaStr
    return ()

escreverPaciente:: Paciente.Paciente -> IO()
escreverPaciente paciente = do
    
    let pacienteStr = Paciente.nome paciente ++ "," ++ show (Paciente.sexo paciente) ++ "," ++ show (Paciente.cpf paciente) ++ "," ++ show (Paciente.cep paciente) ++ "," ++ Paciente.bairro paciente ++ "," ++ Paciente.rua paciente ++ "," ++ show(Paciente.numResidencia paciente) ++ "," ++ Paciente.dataNascimento paciente ++ "," ++ Paciente.telefone paciente ++ "," ++ "\n"
    appendFile "dados/pacientes.txt" pacienteStr
    return ()

constroiVacina :: [String] -> Vacina.Vacina 
constroiVacina lista = 
    Vacina.Vacina {
        Vacina.nome = lista !! 0,
        Vacina.dataFabricacao  =  read (lista !! 1),
        Vacina.dataValidade =  read (lista !! 2),
        Vacina.laboratorio =  lista !! 3,
        Vacina.estoque = read (lista !! 4),
        Vacina.quantidadeDosesNecessarias = read (lista !! 5),
        Vacina.enfermidade =  lista !! 6,
        Vacina.taxaEficiencia = read (lista !! 7),
        Vacina.seloAprovacao =  lista !! 8,
        Vacina.paisOrigem = lista !! 9
    }

constroiPaciente :: [String] -> Paciente.Paciente 
constroiPaciente lista = 
    Paciente.Paciente {
        Paciente.nome = lista !! 0,
        Paciente.sexo  =  read (lista !! 1),
        Paciente.cpf =  read (lista !! 2),
        Paciente.cep =  read (lista !! 3),
        Paciente.bairro = lista !! 4,
        Paciente.rua = lista !! 5,
        Paciente.numResidencia =  read (lista !! 6),
        Paciente.dataNascimento = read (lista !! 7),
        Paciente.telefone =  lista !! 8
    }
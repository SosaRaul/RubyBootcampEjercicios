require_relative 'Agenda'
require_relative 'Contacto'

class Menu
  def menuBienvenida()
    agenda = Agenda.new()

    puts "1-Ver agenda\n2-Editar Contacto\n3-Agregar Contacto\n4-Buscar Contacto\n5-SALIR"
    puts "Ingrese opcion: "
    opcion = gets.chomp.to_i
    until(opcion == 5)
      opciones = (1..4).to_a
      until(opciones.include?(opcion)) do
        puts "Opcion incorrecta "
        puts "1-Ver agenda\n2-Editar Contacto\n3-Agregar Contacto\n4-Buscar Contacto\n5-SALIR"
        opcion = gets.chomp.to_i
      end
      case opcion
      when 1
        agenda.mostrarContactos()
      when 2
        puts "Ingrese nombre del contacto"
        nombre = gets.chomp
        agenda.editarContacto(nombre)
      when 3
        puts "Ingrese nombre "
        nombre = gets.chomp
        puts "Ingrese fecha de nacimiento dd/mm/yyyy "
        fechaNac = gets.chomp
        puts "Ingrese email "
        email = gets.chomp
        puts "Ingrese telefono "
        telefono = gets.chomp
        puts "Ingrese direccion"
        direccion = gets.chomp
        agenda.agregarContacto(nombre,fechaNac,email,telefono,direccion)
      when 4
        puts "Ingrese nombre del contacto buscado "
        nombreBuscado = gets.chomp
        contactoBuscado = agenda.buscarContacto(nombreBuscado)
        if(contactoBuscado)
          agenda.mostrarContacto(contactoBuscado)
        else
          puts "CONTACTO NO ENCONTRADO"
        end
      end

      puts "\nPresione cualquier tecla para seguir o escriba SALIR"
      respuesta = gets.chomp
      if(respuesta.downcase != 'salir')
        system("clear")
        puts "1-Ver agenda\n2-Editar Contacto\n3-Agregar Contacto\n4-Buscar Contacto\n5-SALIR"
        puts "Ingrese opcion: "
        opcion = gets.chomp.to_i
      else
        opcion = 5
      end

    end
  end
end

sesion = Menu.new()
sesion.menuBienvenida()

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const Color kPrimaryPurple = Color(0xFF8C2DF4); 
const Color kDarkPurpleButton = Color(0xFF1B003A); 
const Color kLightBg = Color(0xFFF3F3F3); 

class AppState {
  static String userName = "Claudio";
  static String userRA = "2004";
  static String? userEmail;
  static String? userPassword;

  static List<TaskItem> tasks = [
    TaskItem(
      title: "Tarefa em andamento",
      isCompleted: false,
      date: DateTime(2023, 11, 11),
    ),
    TaskItem(
      title: "Tarefa concluída",
      isCompleted: true,
      date: DateTime(2023, 11, 11),
    ),
  ];
}

class TaskItem {
  String title;
  bool isCompleted;
  DateTime date;

  TaskItem({
    required this.title,
    required this.isCompleted,
    required this.date,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trabalho Uniube',
      theme: ThemeData(
        scaffoldBackgroundColor: kLightBg,
        primaryColor: kPrimaryPurple,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryPurple,
          primary: kPrimaryPurple,
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Bem Vindo,',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: kPrimaryPurple,
                ),
              ),
              Text(
                '${AppState.userName}!',
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: kPrimaryPurple,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'MEU RA: ${AppState.userRA}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Center(
                child: Icon(
                  Icons.assignment_turned_in_rounded,
                  size: 150,
                  color: kPrimaryPurple.withOpacity(0.85),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text(
                    'Acessar Sistema',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
      return;
    }

    if (AppState.userEmail != null && AppState.userPassword != null) {
      if (email != AppState.userEmail || password != AppState.userPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('E-mail ou senha incorretos.')),
        );
        return;
      }
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const CalendarPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                decoration: BoxDecoration(
                  color: kPrimaryPurple,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.checklist_rtl_rounded,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          hintText: 'Digite seu email',
                          hintStyle: TextStyle(color: Colors.black38),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Senha',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          hintText: 'Digite sua senha',
                          hintStyle: TextStyle(color: Colors.black38),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kDarkPurpleButton,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: _login,
                        child: const Text(
                          'Entrar',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterPage()),
                        );
                      },
                      child: const Text(
                        'Não é cadastrado?\nCadastre-se',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _register() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
      return;
    }

    AppState.userEmail = email;
    AppState.userPassword = password;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cadastro realizado com sucesso! Faça login.')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: kPrimaryPurple),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                decoration: BoxDecoration(
                  color: kPrimaryPurple,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person_add_alt_1_rounded,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'email',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          hintText: 'Digite seu melhor email',
                          hintStyle: TextStyle(color: Colors.black38),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Senha',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          hintText: 'Crie uma senha segura',
                          hintStyle: TextStyle(color: Colors.black38),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kDarkPurpleButton,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: _register,
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bem Vindo,',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: kPrimaryPurple,
                ),
              ),
              Text(
                '${AppState.userName}!',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: kPrimaryPurple,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: kPrimaryPurple,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: kPrimaryPurple,
                                onPrimary: Colors.white,
                                onSurface: Colors.black,
                              ),
                            ),
                            child: CalendarDatePicker(
                              initialDate: _selectedDate,
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2030),
                              onDateChanged: (date) {
                                setState(() {
                                  _selectedDate = date;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kDarkPurpleButton,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TasksPage(selectedDate: _selectedDate),
                              ),
                            );
                          },
                          child: const Text(
                            'Selecionar o dia',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TasksPage extends StatefulWidget {
  final DateTime selectedDate;

  const TasksPage({super.key, required this.selectedDate});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<TaskItem> get _dayTasks {
    List<TaskItem> filtered = AppState.tasks.where((task) {
      return task.date.year == widget.selectedDate.year &&
             task.date.month == widget.selectedDate.month &&
             task.date.day == widget.selectedDate.day;
    }).toList();

    List<TaskItem> pending = filtered.where((task) => !task.isCompleted).toList();
    List<TaskItem> completed = filtered.where((task) => task.isCompleted).toList();

    pending.sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
    completed.sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));

    return [...pending, ...completed];
  }

  void _toggleTaskStatus(TaskItem task) {
    setState(() {
      task.isCompleted = !task.isCompleted;
    });
  }

  void _deleteTask(TaskItem task) {
    setState(() {
      AppState.tasks.remove(task);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tarefa excluída.')),
    );
  }

  String _formatDate(DateTime date) {
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();
    return "$day/$month/$year";
  }

  @override
  Widget build(BuildContext context) {
    List<TaskItem> tasks = _dayTasks;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: kPrimaryPurple),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bem Vindo,',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: kPrimaryPurple,
                ),
              ),
              Text(
                '${AppState.userName}!',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: kPrimaryPurple,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Dia ${_formatDate(widget.selectedDate)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: kPrimaryPurple,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: tasks.isEmpty
                              ? const Center(
                                  child: Text(
                                    'Nenhuma tarefa criada para este dia.\nClique no botão "+" abaixo para adicionar!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black45, fontSize: 16),
                                  ),
                                )
                              : ListView.separated(
                                  itemCount: tasks.length,
                                  separatorBuilder: (context, index) => const Divider(color: Colors.black12),
                                  itemBuilder: (context, index) {
                                    final task = tasks[index];
                                    return ListTile(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                      onTap: () => _toggleTaskStatus(task),
                                      leading: task.isCompleted
                                          ? const Icon(
                                              Icons.check_circle_rounded,
                                              color: Colors.green,
                                              size: 26,
                                            )
                                          : Container(
                                              width: 22,
                                              height: 22,
                                              decoration: const BoxDecoration(
                                                color: Colors.blue,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                      title: Text(
                                        task.title,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      subtitle: Text(
                                        task.isCompleted ? 'Tarefa concluída' : 'Tarefa em andamento',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: task.isCompleted ? Colors.green : Colors.blue,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                                        onPressed: () => _deleteTask(task),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddTaskPage(selectedDate: widget.selectedDate),
                            ),
                          );
                          setState(() {});
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              )
                            ],
                          ),
                          child: const Icon(
                            Icons.add_rounded,
                            color: kPrimaryPurple,
                            size: 36,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddTaskPage extends StatefulWidget {
  final DateTime selectedDate;

  const AddTaskPage({super.key, required this.selectedDate});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _taskController = TextEditingController();

  void _saveTask() {
    String text = _taskController.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, digite o nome da tarefa.')),
      );
      return;
    }

    AppState.tasks.add(
      TaskItem(
        title: text,
        isCompleted: false,
        date: widget.selectedDate,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tarefa adicionada com sucesso!')),
    );

    Navigator.pop(context);
  }

  String _formatDate(DateTime date) {
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();
    return "$day/$month/$year";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: kPrimaryPurple),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bem Vindo,',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: kPrimaryPurple,
                ),
              ),
              Text(
                '${AppState.userName}!',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: kPrimaryPurple,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Dia ${_formatDate(widget.selectedDate)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: kPrimaryPurple,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: TextField(
                            controller: _taskController,
                            maxLines: null,
                            expands: true,
                            textAlignVertical: TextAlignVertical.top,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Digite o título da tarefa aqui...',
                              hintStyle: TextStyle(color: Colors.black38),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kDarkPurpleButton,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: _saveTask,
                          child: const Text(
                            'Adicionar tarefa',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
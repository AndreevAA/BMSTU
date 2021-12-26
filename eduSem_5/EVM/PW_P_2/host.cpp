#include "xcl2.hpp"
 #include <algorithm>
 #include <cstdio>
 #include <random>
 #include <vector>

using std::default_random_engine;
using std::generate;
using std::uniform_int_distribution;
using std::vector;

const int DATA_SIZE = 1 << 10;

// ------------------------------------------------------------------------------------

// \u0413\u0435\u043d\u0435\u0440\u0430\u0442\u043e\u0440 \u0441\u043b\u0443\u0447\u0430\u0439\u043d\u044b\u0445 \u0447\u0438\u0441\u0435\u043b \u0434\u043b\u044f \u0441\u043e\u0437\u0434\u0430\u043d\u0438\u044f \u043c\u0430\u0441\u0441\u0438\u0432\u043e\u0432

// ------------------------------------------------------------------------------------

 int gen_random() {
 static default_random_engine e;
 static uniform_int_distribution<int> dist(0, 100);

 return dist(e);
}

// ------------------------------------------------------------------------------------

// \u0424\u0443\u043d\u043a\u0446\u0438\u044f \u0434\u043b\u044f \u043f\u0440\u043e\u0432\u0435\u0440\u043a\u0438  \u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u043e\u0441\u0442\u0438 \u0440\u0430\u0431\u043e\u0442\u044b \u0443\u0441\u043a\u043e\u0440\u0438\u0442\u0435\u043b\u044f

// ------------------------------------------------------------------------------------

void var003_no_pragmas(int* c, const int* a, const int* b, const int len) {
 int tmp = 0;
 for (int i = 0; i < len; i++) {
 tmp = tmp + a[i];
 }
 for (int i = 0; i < len; i++) {
 if (b[i] > tmp/len) {
 c[i] = b[i];
 } else {
 c[i] = a[i];
 }
 }
}

// ------------------------------------------------------------------------------------

// \u041f\u0440\u043e\u0432\u0435\u0440\u043a\u0430 \u0440\u0435\u0437\u0443\u043b\u044c\u0442\u0430\u0442\u043e\u0432 \u0440\u0430\u0431\u043e\u0442\u044b \u0443\u0441\u043a\u043e\u0440\u0438\u0442\u0435\u043b\u044f

// ------------------------------------------------------------------------------------

void verify(const vector<int, aligned_allocator<int> >& gold, const vector<int, aligned_allocator<int> >& out) {
 if (!equal(begin(gold), end(gold), begin(out))) {
 printf("TEST FAILED\n");
 exit(EXIT_FAILURE);
 }
}

int main(int argc, char** argv) {
 if (argc != 2) {
 std::cout << "Usage: " << argv[0] << " <XCLBIN File>" << std::endl;
 return EXIT_FAILURE;
 }

 std::string binaryFile = argv[1];

 // \u0412\u044b\u0447\u0438\u0441\u043b\u0435\u043d\u0438\u0435 \u0440\u0430\u0437\u043c\u0435\u0440\u0430 \u043c\u0430\u0441\u0441\u0438\u0432\u0430
 size_t size_in_bytes = DATA_SIZE * sizeof(int);
 cl_int err;
 cl::CommandQueue q;
 cl::Context context;
 cl::Program program;

 // \u041e\u0431\u044a\u044f\u0432\u043b\u0435\u043d\u0438\u0435 \u0438 \u0438\u043d\u0438\u0446\u0438\u0430\u043b\u0438\u0437\u0430\u0446\u0438\u044f \u0438\u0441\u0445\u043e\u0434\u043d\u044b\u0445 \u043c\u0430\u0441\u0441\u0438\u0432\u043e\u0432 \u0440\u0430\u0437\u043c\u0435\u0440\u043d\u043e\u0441\u0442\u0438 DATA_SIZE
 vector<int, aligned_allocator<int> > source_a(DATA_SIZE);
 vector<int, aligned_allocator<int> > source_b(DATA_SIZE);
 vector<int, aligned_allocator<int> > source_results(DATA_SIZE);
 generate(begin(source_a), end(source_a), gen_random);
 generate(begin(source_b), end(source_b), gen_random);

 printf("source_a: ");

for (int i = 0; i < DATA_SIZE; i++)
{
 printf("%d, ", source_a[i] );
}

printf("\n\nsource_b: ");

for (int i = 0; i < DATA_SIZE; i++)
{
 printf("%d, ", source_b[i] );
}

printf("\n\n");


 // \u041f\u043e\u043b\u0443\u0447\u0435\u043d\u0438\u0435 \u0441\u043f\u0438\u0441\u043a\u0430 \u0443\u0441\u0442\u0440\u043e\u0439\u0441\u0442\u0432 \u0438 \u0438\u043d\u0438\u0446\u0438\u0430\u043b\u0438\u0437\u0430\u0446\u0438\u044f \u043a\u043e\u043d\u0442\u0435\u043a\u0441\u0442\u0430
 auto devices = xcl::get_xil_devices();
 auto fileBuf = xcl::read_binary_file(binaryFile);
 cl::Program::Binaries bins{{fileBuf.data(), fileBuf.size()}};
 bool valid_device = false;
 for (unsigned int i = 0; i < devices.size(); i++) {
 auto device = devices[i];
 // \u0417\u043e\u0437\u0434\u0430\u043d\u0438\u0435 \u043a\u043e\u043d\u0442\u0435\u043a\u0441\u0442\u0430 \u0438 \u043e\u0447\u0435\u0440\u0435\u0434\u0435\u0439 \u043a\u043e\u043c\u0430\u043d\u0434 \u043a \u0443\u0441\u0442\u0440\u043e\u0439\u0441\u0442\u0432\u0430\u043c (\u0435\u0441\u043b\u0438 \u0438\u0445 \u043d\u0435\u0441\u043a\u043e\u043b\u044c\u043a\u043e)
 OCL_CHECK(err, context = cl::Context(device, nullptr, nullptr, nullptr, &err));
 OCL_CHECK(err, q = cl::CommandQueue(context, device, CL_QUEUE_PROFILING_ENABLE, &err));

 std::cout << "Trying to program device[" << i << "]: " << device.getInfo<CL_DEVICE_NAME>() << std::endl;
 program = cl::Program(context, {device}, bins, nullptr, &err);
 if (err != CL_SUCCESS) {
 std::cout << "Failed to program device[" << i << "] with xclbin file!\n";
 } else {
 std::cout << "Device[" << i << "]: program successful!\n";
 valid_device = true;
 break;
 }
 }
 if (!valid_device) {
 std::cout << "Failed to program any device found, exit!\n";
 exit(EXIT_FAILURE);
 }

 // \u0412\u044b\u0434\u0435\u043b\u0435\u043d\u0438\u0435 \u043f\u0430\u043c\u044f\u0442\u0438 \u043f\u043e\u0434 \u0431\u0443\u0444\u0435\u0440\u044b \u0443\u0441\u0442\u0440\u0439\u0441\u0442\u0432\u0430
 OCL_CHECK(err, cl::Buffer buffer_a(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_ONLY, size_in_bytes, source_a.data(),
 &err));
 OCL_CHECK(err, cl::Buffer buffer_b(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_ONLY, size_in_bytes, source_b.data(),
 &err));
 OCL_CHECK(err, cl::Buffer buffer_result(context, CL_MEM_USE_HOST_PTR | CL_MEM_WRITE_ONLY, size_in_bytes,
 source_results.data(), &err));

 // \u0412\u0435\u043a\u0442\u043e\u0440 \u0434\u043b\u044f \u043f\u0440\u043e\u0432\u0435\u0440\u043a\u0438 \u0440\u0435\u0437\u0443\u043b\u044c\u0442\u0430\u0442\u043e\u0432 \u0440\u0430\u0431\u043e\u0442\u044b \u0443\u0441\u043a\u043e\u0440\u0438\u0442\u0435\u043b\u044f
 vector<int, aligned_allocator<int> > gold(DATA_SIZE);
 var003_no_pragmas(gold.data(), source_a.data(), source_b.data(), DATA_SIZE);

 printf(
 "|-------------------------+-------------------------|\n"
 "| Kernel                  |    Wall-Clock Time (ns) |\n"
 "|-------------------------+-------------------------|\n");

// ------------------------------------------------------------------------------------

 // \u0422\u0435\u0441\u0442 \u0443\u0441\u043a\u043e\u0440\u0438\u0442\u0435\u043b\u044f \u0431\u0435\u0437 \u0438\u0441\u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u043d\u0438\u044f \u043e\u043f\u0442\u0438\u043c\u0438\u0437\u0430\u0446\u0438\u0438 (no_pragmas)

// ------------------------------------------------------------------------------------

 OCL_CHECK(err, cl::Kernel kernel_var003_no_pragmas(program, "var003_no_pragmas", &err));

// \u0423\u0441\u0442\u0430\u043d\u0430\u0432\u043b\u0438\u0432\u0430\u0435\u043c \u043d\u0435\u043e\u0431\u0445\u043e\u0434\u0438\u043c\u044b\u0435 \u043d\u0430\u043c \u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f

 OCL_CHECK(err, err = kernel_var003_no_pragmas.setArg(0, buffer_result));
 OCL_CHECK(err, err = kernel_var003_no_pragmas.setArg(1, buffer_a));
 OCL_CHECK(err, err = kernel_var003_no_pragmas.setArg(2, buffer_b));
 OCL_CHECK(err, err = kernel_var003_no_pragmas.setArg(3, DATA_SIZE));

 // \u041a\u043e\u043f\u0438\u0440\u0443\u0435\u043c \u0441\u043e\u0434\u0435\u0440\u0436\u0438\u043c\u043e\u0435 \u0431\u0443\u0444\u0435\u0440\u043e\u0432 \u0432 DDR \u043f\u0430\u043c\u044f\u0442\u044c \u0443\u0441\u043a\u043e\u0440\u0438\u0442\u0435\u043b\u044c\u043d\u043e\u0439 \u043a\u0430\u0440\u0442\u044b
 OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_a, buffer_b}, 0 /* 0 means from host*/));

 cl::Event event;
 uint64_t nstimestart, nstimeend;
 // \u0417\u0430\u043f\u0443\u0441\u043a\u0430\u0435\u043c \u0437\u0430\u0434\u0430\u0447\u0443 \u043d\u0430 \u0438\u0441\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u0435 \u0438 \u0436\u0434\u0435\u043c \u0433\u043e\u0442\u043e\u0432\u043d\u043e\u0441\u0442\u0438 \u043f\u043e \u043f\u0440\u0435\u0440\u044b\u0432\u0430\u043d\u0438\u044e
 OCL_CHECK(err, err = q.enqueueTask(kernel_var003_no_pragmas, nullptr, &event));
 q.finish();

 //\u0427\u0438\u0442\u0430\u0435\u043c \u043c\u0435\u0442\u043a\u0438 \u0432\u0440\u0435\u043c\u0435\u043d\u0438 \u0438\u0441\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u044f \u0437\u0430\u0434\u0430\u0447\u0438
 OCL_CHECK(err, err = event.getProfilingInfo<uint64_t>(CL_PROFILING_COMMAND_START, &nstimestart));
 OCL_CHECK(err, err = event.getProfilingInfo<uint64_t>(CL_PROFILING_COMMAND_END, &nstimeend));
 auto no_pragmas_time = nstimeend - nstimestart;

 printf("| %-22s  | %23lu |\n", "var003_no_pragmas", no_pragmas_time);
 printf("|-------------------------+-------------------------|\n");


 printf("ARRAY no pragmas BEFORE: ");

   for (int i = 0; i < DATA_SIZE; i++)
   {
  	 printf("%d, ", source_results[i] );
   }

  printf("\n");

 // \u0427\u0438\u0442\u0430\u0435\u043c \u043e\u0431\u0440\u0430\u0442\u043d\u043e \u0434\u0430\u043d\u043d\u044b\u0435 \u0438\u0437 DDR \u043f\u0430\u043c\u044f\u0442\u0438 \u0443\u0441\u0442\u0440\u043e\u0439\u0441\u0442\u0432\u0430 \u0432 \u0431\u0443\u0444\u0435\u0440 \u0440\u0435\u0437\u0443\u043b\u044c\u0442\u0430\u0442\u043e\u0432
 OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_result}, CL_MIGRATE_MEM_OBJECT_HOST));
 q.finish();

 printf("ARRAY no pragmas: ");

  for (int i = 0; i < DATA_SIZE; i++)
  {
 	 printf("%d, ", source_results[i] );
  }
 verify(gold, source_results);

// ------------------------------------------------------------------------------------

 // \u0422\u0435\u0441\u0442 \u0443\u0441\u043a\u043e\u0440\u0438\u0442\u0435\u043b\u044f \u0441 \u0440\u0430\u0437\u0432\u0435\u0440\u0442\u044b\u0432\u0430\u043d\u0438\u0435\u043c \u0446\u0438\u043a\u043b\u043e\u0432 (untolled)

// ------------------------------------------------------------------------------------

 OCL_CHECK(err, cl::Kernel kernel_var003_unrolled(program, "var003_unrolled", &err));

// \u0423\u0441\u0442\u0430\u043d\u0430\u0432\u043b\u0438\u0432\u0430\u0435\u043c \u043d\u0435\u043e\u0431\u0445\u043e\u0434\u0438\u043c\u044b\u0435 \u043d\u0430\u043c \u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f

 OCL_CHECK(err, err = kernel_var003_unrolled.setArg(0, buffer_result));
 OCL_CHECK(err, err = kernel_var003_unrolled.setArg(1, buffer_a));
 OCL_CHECK(err, err = kernel_var003_unrolled.setArg(2, buffer_b));
 OCL_CHECK(err, err = kernel_var003_unrolled.setArg(3, DATA_SIZE));

 // \u0412\u0442\u043e\u0440\u043e\u0439 \u0440\u0430\u0437 \u043a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u043f\u0430\u043c\u044f\u0442\u044c \u043d\u0435 \u0442\u0440\u0435\u0431\u0443\u0435\u0442\u0441\u044f: DDR \u043f\u0430\u043c\u044f\u0442\u044c \u0438\u0441\u043f\u043e\u043b\u044c\u0437\u0443\u0435\u0442\u0441\u044f \u0432\u0441\u0435\u043c\u0438 \u0443\u0441\u043a\u043e\u0440\u0438\u0442\u0435\u043b\u044f\u043c\u0438
 // \u0417\u0430\u043f\u0443\u0441\u043a\u0430\u0435\u043c \u0437\u0430\u0434\u0430\u0447\u0443 \u043d\u0430 \u0438\u0441\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u0435 \u0438 \u0436\u0434\u0435\u043c \u0433\u043e\u0442\u043e\u0432\u043d\u043e\u0441\u0442\u0438 \u043f\u043e \u043f\u0440\u0435\u0440\u044b\u0432\u0430\u043d\u0438\u044e
 OCL_CHECK(err, err = q.enqueueTask(kernel_var003_unrolled, nullptr, &event));
 q.finish();

 //\u0427\u0438\u0442\u0430\u0435\u043c \u043c\u0435\u0442\u043a\u0438 \u0432\u0440\u0435\u043c\u0435\u043d\u0438 \u0438\u0441\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u044f \u0437\u0430\u0434\u0430\u0447\u0438
 OCL_CHECK(err, err = event.getProfilingInfo<uint64_t>(CL_PROFILING_COMMAND_START, &nstimestart));
 OCL_CHECK(err, err = event.getProfilingInfo<uint64_t>(CL_PROFILING_COMMAND_END, &nstimeend));
 auto unrolled_time = nstimeend - nstimestart;

 printf("| %-22s  | %23lu |\n", "var003_unrolled", unrolled_time);
 printf("|-------------------------+-------------------------|\n");

 // \u0427\u0438\u0442\u0430\u0435\u043c \u043e\u0431\u0440\u0430\u0442\u043d\u043e \u0434\u0430\u043d\u043d\u044b\u0435 \u0438\u0437 DDR \u043f\u0430\u043c\u044f\u0442\u0438 \u0443\u0441\u0442\u0440\u043e\u0439\u0441\u0442\u0432\u0430 \u0432 \u0431\u0443\u0444\u0435\u0440 \u0440\u0435\u0437\u0443\u043b\u044c\u0442\u0430\u0442\u043e\u0432
 OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_result}, CL_MIGRATE_MEM_OBJECT_HOST));
 q.finish();

 printf("ARRAY: ");

 for (int i = 0; i < DATA_SIZE; i++)
 {
	 printf("%d, ", source_results[i] );
 }

 verify(gold, source_results);

// ------------------------------------------------------------------------------------

   // \u0422\u0435\u0441\u0442 \u0443\u0441\u043a\u043e\u0440\u0438\u0442\u0435\u043b\u044f \u0441 \u043a\u043e\u043d\u0432\u0435\u0439\u0435\u0440\u0438\u0437\u0430\u0446\u0438\u0435\u0439 (pipelined)

// ------------------------------------------------------------------------------------

 OCL_CHECK(err, cl::Kernel kernel_var003_pipelined(program, "var003_pipelined", &err));

// \u0423\u0441\u0442\u0430\u043d\u0430\u0432\u043b\u0438\u0432\u0430\u0435\u043c \u043d\u0435\u043e\u0431\u0445\u043e\u0434\u0438\u043c\u044b\u0435 \u043d\u0430\u043c \u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f

 OCL_CHECK(err, err = kernel_var003_pipelined.setArg(0, buffer_result));
 OCL_CHECK(err, err = kernel_var003_pipelined.setArg(1, buffer_a));
 OCL_CHECK(err, err = kernel_var003_pipelined.setArg(2, buffer_b));
 OCL_CHECK(err, err = kernel_var003_pipelined.setArg(3, DATA_SIZE));

 // \u0412\u0442\u043e\u0440\u043e\u0439 \u0440\u0430\u0437 \u043a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u043f\u0430\u043c\u044f\u0442\u044c \u043d\u0435 \u0442\u0440\u0435\u0431\u0443\u0435\u0442\u0441\u044f: DDR \u043f\u0430\u043c\u044f\u0442\u044c \u0438\u0441\u043f\u043e\u043b\u044c\u0437\u0443\u0435\u0442\u0441\u044f \u0432\u0441\u0435\u043c\u0438 \u0443\u0441\u043a\u043e\u0440\u0438\u0442\u0435\u043b\u044f\u043c\u0438
 // \u0417\u0430\u043f\u0443\u0441\u043a\u0430\u0435\u043c \u0437\u0430\u0434\u0430\u0447\u0443 \u043d\u0430 \u0438\u0441\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u0435 \u0438 \u0436\u0434\u0435\u043c \u0433\u043e\u0442\u043e\u0432\u043d\u043e\u0441\u0442\u0438 \u043f\u043e \u043f\u0440\u0435\u0440\u044b\u0432\u0430\u043d\u0438\u044e
 OCL_CHECK(err, err = q.enqueueTask(kernel_var003_pipelined, nullptr, &event));
 q.finish();

 //\u0427\u0438\u0442\u0430\u0435\u043c \u043c\u0435\u0442\u043a\u0438 \u0432\u0440\u0435\u043c\u0435\u043d\u0438 \u0438\u0441\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u044f \u0437\u0430\u0434\u0430\u0447\u0438
 OCL_CHECK(err, err = event.getProfilingInfo<uint64_t>(CL_PROFILING_COMMAND_START, &nstimestart));
 OCL_CHECK(err, err = event.getProfilingInfo<uint64_t>(CL_PROFILING_COMMAND_END, &nstimeend));
 auto pipelined_time = nstimeend - nstimestart;

 printf("| %-22s  | %23lu |\n", "var003_pipelined", pipelined_time);
 printf("|-------------------------+-------------------------|\n");

 // \u0427\u0438\u0442\u0430\u0435\u043c \u043e\u0431\u0440\u0430\u0442\u043d\u043e \u0434\u0430\u043d\u043d\u044b\u0435 \u0438\u0437 DDR \u043f\u0430\u043c\u044f\u0442\u0438 \u0443\u0441\u0442\u0440\u043e\u0439\u0441\u0442\u0432\u0430 \u0432 \u0431\u0443\u0444\u0435\u0440 \u0440\u0435\u0437\u0443\u043b\u044c\u0442\u0430\u0442\u043e\u0432
 OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_result}, CL_MIGRATE_MEM_OBJECT_HOST));
 q.finish();
 verify(gold, source_results);

 // -------------------------------------------------------------------------------------------------
 // \u0422\u0435\u0441\u0442 \u0443\u0441\u043a\u043e\u0440\u0438\u0442\u0435\u043b\u044f \u0441 \u0440\u0430\u0437\u0432\u0435\u0440\u0442\u044b\u0432\u0430\u043d\u0438\u0435\u043c \u0446\u0438\u043a\u043b\u0430 \u0438 \u043a\u043e\u043d\u0432\u0435\u0439\u0435\u0440\u0438\u0437\u0430\u0446\u0438\u0435\u0439 (pipe_unroll)
 // -------------------------------------------------------------------------------------------------

 OCL_CHECK(err, cl::Kernel kernel_var003_pipe_unroll(program, "var003_pipe_unroll", &err));

// \u0423\u0441\u0442\u0430\u043d\u0430\u0432\u043b\u0438\u0432\u0430\u0435\u043c \u043d\u0435\u043e\u0431\u0445\u043e\u0434\u0438\u043c\u044b\u0435 \u043d\u0430\u043c \u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f

 OCL_CHECK(err, err = kernel_var003_pipe_unroll.setArg(0, buffer_result));
 OCL_CHECK(err, err = kernel_var003_pipe_unroll.setArg(1, buffer_a));
 OCL_CHECK(err, err = kernel_var003_pipe_unroll.setArg(2, buffer_b));
 OCL_CHECK(err, err = kernel_var003_pipe_unroll.setArg(3, DATA_SIZE));

 // \u0412\u0442\u043e\u0440\u043e\u0439 \u0440\u0430\u0437 \u043a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u043f\u0430\u043c\u044f\u0442\u044c \u043d\u0435 \u0442\u0440\u0435\u0431\u0443\u0435\u0442\u0441\u044f: DDR \u043f\u0430\u043c\u044f\u0442\u044c \u0438\u0441\u043f\u043e\u043b\u044c\u0437\u0443\u0435\u0442\u0441\u044f \u0432\u0441\u0435\u043c\u0438 \u0443\u0441\u043a\u043e\u0440\u0438\u0442\u0435\u043b\u044f\u043c\u0438
 // \u0417\u0430\u043f\u0443\u0441\u043a\u0430\u0435\u043c \u0437\u0430\u0434\u0430\u0447\u0443 \u043d\u0430 \u0438\u0441\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u0435 \u0438 \u0436\u0434\u0435\u043c \u0433\u043e\u0442\u043e\u0432\u043d\u043e\u0441\u0442\u0438 \u043f\u043e \u043f\u0440\u0435\u0440\u044b\u0432\u0430\u043d\u0438\u044e
 OCL_CHECK(err, err = q.enqueueTask(kernel_var003_pipe_unroll, nullptr, &event));
 q.finish();

 //\u0427\u0438\u0442\u0430\u0435\u043c \u043c\u0435\u0442\u043a\u0438 \u0432\u0440\u0435\u043c\u0435\u043d\u0438 \u0438\u0441\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u044f \u0437\u0430\u0434\u0430\u0447\u0438
 OCL_CHECK(err, err = event.getProfilingInfo<uint64_t>(CL_PROFILING_COMMAND_START, &nstimestart));
 OCL_CHECK(err, err = event.getProfilingInfo<uint64_t>(CL_PROFILING_COMMAND_END, &nstimeend));
 auto pipe_unroll_time = nstimeend - nstimestart;

 printf("| %-22s  | %23lu |\n", "var003_pipe_unroll", pipe_unroll_time);
 printf("|-------------------------+-------------------------|\n");
 printf(
 "Note: Wall Clock Time is meaningful for real hardware execution "
 "only, not for emulation.\n");
 printf(
 "Please refer to profile summary for kernel execution time for "
 "hardware emulation.\n");

 // \u0427\u0438\u0442\u0430\u0435\u043c \u043e\u0431\u0440\u0430\u0442\u043d\u043e \u0434\u0430\u043d\u043d\u044b\u0435 \u0438\u0437 DDR \u043f\u0430\u043c\u044f\u0442\u0438 \u0443\u0441\u0442\u0440\u043e\u0439\u0441\u0442\u0432\u0430 \u0432 \u0431\u0443\u0444\u0435\u0440 \u0440\u0435\u0437\u0443\u043b\u044c\u0442\u0430\u0442\u043e\u0432
 OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_result}, CL_MIGRATE_MEM_OBJECT_HOST));
 q.finish();
 verify(gold, source_results);

 printf("TEST PASSED.\n");
 return EXIT_SUCCESS;
}

// @ts-check

async function retryFetchIfResponseNotJson(url) {
    let attempts = 0;
    while (attempts < 3) {
        const response = await fetch(url);
        if (response.ok && response.headers.get('content-type')?.includes('application/json')) {
            return response.json();
        }
        attempts++;
    }
}

function splitIntoBatches(array, batchSize = 10) {
  const batches = [];
  for (let i = 0; i < array.length; i += batchSize) {
    batches.push(array.slice(i, i + batchSize));
  }
  return batches;
}

const urls = []
for (let page = 1; page <= 10; page++) {
    urls.push(`https://packages.ecosyste.ms/api/v1/registries/npmjs.org/package_names?order=desc&sort=downloads&page=${page}&per_page=100`)
}

for (const batch of splitIntoBatches(urls)) {
    const responses = await Promise.all(batch.map(url => retryFetchIfResponseNotJson(url)));
    for (const data of responses) {
        for (const pkg of data) {
            const url = `https://api.npmjs.org/versions/${encodeURIComponent(pkg)}/last-week`
            const data = await retryFetchIfResponseNotJson(url)
            const top10 = Object.entries(data.downloads)
            .filter(([_, downloads]) => downloads > 10_000)
            .sort(([_a, a], [_b, b]) => {
                return b - a
            })
            .slice(0, 10)

            for (const [version] of top10) {
                console.log(`npm cache add ${pkg}@${version}`)
            }
        }
    }
}

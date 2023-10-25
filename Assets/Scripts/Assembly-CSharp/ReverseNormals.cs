using System;
using UnityEngine;

// Token: 0x02000036 RID: 54
[RequireComponent(typeof(MeshFilter))]
public class ReverseNormals : MonoBehaviour
{
	// Token: 0x060000E5 RID: 229 RVA: 0x000047CC File Offset: 0x000029CC
	private void Start()
	{
		MeshFilter meshFilter = base.GetComponent(typeof(MeshFilter)) as MeshFilter;
		if (meshFilter != null)
		{
			Mesh mesh = meshFilter.mesh;
			Vector3[] normals = mesh.normals;
			for (int i = 0; i < normals.Length; i++)
			{
				normals[i] = -normals[i];
			}
			mesh.normals = normals;
			for (int j = 0; j < mesh.subMeshCount; j++)
			{
				int[] triangles = mesh.GetTriangles(j);
				for (int k = 0; k < triangles.Length; k += 3)
				{
					int num = triangles[k];
					triangles[k] = triangles[k + 1];
					triangles[k + 1] = num;
				}
				mesh.SetTriangles(triangles, j);
			}
		}
	}
}
